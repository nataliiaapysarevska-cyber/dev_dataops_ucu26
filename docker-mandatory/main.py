import pandas as pd
import streamlit as st
import sys

# Page settings
st.set_page_config(
    page_title="Recipe Finder",
    page_icon="🍳",
    layout="centered"
)

st.title("🍳 Recipe Finder")
st.write("Find out what you can cook with the ingredients you have.")
# Read data
ingredients_df = pd.read_csv(sys.argv[1])
recipes_df = pd.read_csv("data/recipes.csv")

available_ingredients = set(
    ingredients_df["ingredient"].str.strip().str.lower()
)

st.caption(f"🥕 {len(available_ingredients)} ingredients available")


# Find suitable recipes
can_cook = []
almost_there = []
not_enough = []

for _, row in recipes_df.iterrows():

    recipe_name = row["recipe"]

    required_ingredients = {
        ingredient.strip().lower()
        for ingredient in row["ingredients"].split(",")
    }

    missing_ingredients = required_ingredients - available_ingredients

    if len(missing_ingredients) == 0:
        can_cook.append((recipe_name, required_ingredients))

    elif len(missing_ingredients) <= 2:
        almost_there.append((recipe_name, missing_ingredients))

    else:
        not_enough.append((recipe_name, missing_ingredients))

# Show results
st.divider()

st.header("🍳 What can I cook?")


# Recipes you can cook
st.subheader("✅ Ready to cook")

if can_cook:
    for recipe, ingredients in can_cook:
        with st.container(border=True):
            st.markdown(f"### {recipe}")
            st.caption("You have all the ingredients")
            st.write(" • ".join(sorted(ingredients)))
else:
    st.info("No recipes available with your current ingredients.")


# Recipes where only 1–2 ingredients are missing
st.subheader("🛒 Almost there")

if almost_there:
    for recipe, missing in almost_there:
        with st.container(border=True):
            st.markdown(f"**{recipe}**")
            st.write(
                f"Missing: {', '.join(sorted(missing))}"
            )
else:
    st.info("No recipes in this category.")


# Recipes where more ingredients are missing
with st.expander(f"❌ Not enough ingredients ({len(not_enough)})"):
    for recipe, missing in not_enough:
        st.markdown(f"**{recipe}**")
        st.caption(
            f"Missing: {', '.join(sorted(missing))}"
        )
        st.divider()