// ignore_for_file: non_constant_identifier_names
import 'package:hive/hive.dart';
import 'package:prj1/models/model.dart';

final List<Map<String, dynamic>> Data = [
  {
    'title': 'Chicken Burger',
    'time': '30',
    'description':
        'A chicken burger is a delicious variation of the classic hamburger, featuring a seasoned and cooked chicken patty as the star ingredient...',
    'incredients': '''
      1 pound ground chicken
      Salt and black pepper to taste
      4 hamburger buns
      4 slices of cheese (cheddar, American, or your choice)
      Lettuce leaves
      Sliced tomatoes
      Sliced red onions
      Pickles
      Ketchup and mustard (optional)
      Mayonnaise (optional)
    ''',
    'procedure': '''
      1. Preheat the Grill or Pan:
         - If you're using a grill, preheat it to medium-high heat. If you're using a pan, set it over medium-high heat.
      2. Prepare the Patties:
         - Divide the ground chicken into 4 equal portions...
      3. Cook the Patties:
         - Place the patties on the preheated grill or pan...
      4. Add Cheese:
         - In the last minute of cooking, place a slice of cheese on each patty...
      5. Toast the Buns:
         - Slice the hamburger buns in half...
      6. Assemble the Burgers:
         - Spread mayonnaise, ketchup, or mustard on the bottom half of each bun...
      7. Serve:
         - Your classic chicken burgers are ready to be served! Pair them with your favorite side dishes and enjoy...
      Feel free to customize the toppings and condiments based on your preferences. Happy cooking!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Fburger1.jpg?alt=media&token=b99d49d5-81e1-4cc4-9d77-9f8f4e5650fb',
    'category': 'Burger',
  },
  {
    'title': 'Zinger Burger',
    'time': '38',
    'description':
        'Zinger burger is a popular and flavorful fast-food dish that originated from the combination of Western and Asian culinary influences. Typically associated with fast-food chains, the zinger burger features a seasoned and crispy fried chicken fillet, often marinated with a blend of spices, herbs, and buttermilk for added tenderness and flavor. The chicken fillet is then coated in a seasoned flour mixture and deep-fried until golden brown and crispy.',
    'incredients': '''
     500g boneless chicken, cut into fillets
1 cup buttermilk
1 teaspoon salt
1 teaspoon black pepper
1 teaspoon paprika
1 teaspoon garlic powder
1 teaspoon onion powder
1 teaspoon dried thyme
1 cup all-purpose flour
1 teaspoon salt (for coating)
1 teaspoon black pepper (for coating)
1 teaspoon paprika (for coating)
1 teaspoon garlic powder (for coating)
1 teaspoon onion powder (for coating)
1 teaspoon dried thyme (for coating)
Vegetable oil for deep frying
Burger buns
Lettuce leaves
Tomato slices
Mayonnaise
Hot sauce (optional)
    ''',
    'procedure': '''
     Marinate the Chicken:

In a bowl, mix buttermilk, salt, black pepper, paprika, garlic powder, onion powder, and dried thyme.
Add chicken fillets to the marinade, ensuring they are well coated.
Cover the bowl and refrigerate for at least 2 hours or overnight for better flavor.
Prepare the Coating:

In a separate bowl, mix all-purpose flour, salt, black pepper, paprika, garlic powder, onion powder, and dried thyme.
Coat the Chicken:

Heat vegetable oil in a deep fryer or a large pan to 350°F (175°C).
Take each marinated chicken fillet and coat it in the flour mixture, pressing the coating onto the chicken.
Fry the Chicken:

Carefully place the coated chicken fillets in the hot oil and fry until golden brown and crispy (usually about 5-6 minutes per side).
Ensure the chicken is cooked through by cutting into one piece to check.
Assemble the Burger:

Toast the burger buns lightly.
Spread mayonnaise on the bottom half of each bun.
Place a lettuce leaf on the bun, followed by a tomato slice.
Put the fried chicken fillet on top.
Add hot sauce if you like it spicy.
Top with the other half of the bun.
Serve:

Serve your homemade Zinger Burgers immediately while they are still warm and crispy.
Enjoy your delicious Zinger Burger! Feel free to customize it with your favorite toppings and sauces.
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2FZinger%20burrger.jpg?alt=media&token=d7888a04-9a80-44f3-97bf-51eeb2c108c3',
    'category': 'Burger',
  },
  {
    'title': 'Tomato Dip',
    'time': '10',
    'description':
        'This tomato dip is a burst of flavor, combining diced tomatoes, sautéed red onions, and garlic, elevated by a touch of olive oil and balsamic vinegar. Optional fresh basil adds a hint of freshness. Versatile and easy to make, it pairs seamlessly with your favorite dippers, making snack time a delightful experience with every dip.',
    'incredients': '''
     1 cup diced tomatoes (fresh or canned)
1/4 cup finely chopped red onion
2 cloves garlic, minced
1 tablespoon olive oil
1 teaspoon balsamic vinegar
Salt and pepper to taste
1 tablespoon fresh basil, chopped (optional)
    ''',
    'procedure': '''
    Prepare Tomatoes:

If using fresh tomatoes, dice them finely. If using canned tomatoes, drain excess liquid and dice if not already diced.
Sauté Onions and Garlic:

In a pan, heat olive oil over medium heat. Add finely chopped red onions and minced garlic. Sauté until onions are translucent and garlic is fragrant.
Add Tomatoes:

Add the diced tomatoes to the pan. Cook for about 5-7 minutes, or until the tomatoes break down and the mixture thickens.
Season:

Season the mixture with salt and pepper to taste. Adjust according to your preference.
Add Balsamic Vinegar:

Stir in the balsamic vinegar, and cook for an additional 2-3 minutes. This adds a touch of acidity and sweetness to the dip.
Optional: Add Fresh Basil:

If desired, stir in fresh chopped basil for a burst of flavor. This is optional but adds a wonderful freshness to the dip.
Cool and Serve:

Allow the dip to cool before serving. You can serve it at room temperature or chilled.
Serve with Your Choice of Dippers:

Pair the tomato dip with tortilla chips, pita bread, vegetable sticks, or crackers.
Enjoy your homemade tomato dip as a flavorful accompaniment to your favorite snacks!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Ftomatodip.jpg?alt=media&token=eb5514c2-e40b-4a84-a409-cf3b0019b078',
    'category': 'Dips',
  },
  {
    'title': 'Rice Wrap',
    'time': '18',
    'description':
        'A rice wrap, often known as a rice paper roll or spring roll, is a light and refreshing dish typically filled with a variety of fresh vegetables, herbs, and sometimes protein, all enclosed in a translucent rice paper wrapper. ',
    'incredients': '''
    For the Rice Wraps:

Rice paper wrappers (round sheets)
Warm water (for soaking the rice paper)
For the Filling (adjust quantities based on your preferences):

Thin rice vermicelli noodles, cooked and cooled
Carrots, julienned
Cucumber, julienned
Bell peppers, thinly sliced
Lettuce leaves
Fresh mint leaves
Fresh cilantro leaves
Protein options (optional): Cooked shrimp, tofu, or shredded chicken
For the Dipping Sauce:

Soy sauce
Hoisin sauce
Peanut butter
Lime juice
Sesame oil
Crushed garlic
Sriracha or chili sauce (optional, for heat)
    ''',
    'procedure': '''
Prepare the Ingredients:

Cook rice vermicelli noodles according to package instructions. Rinse with cold water and set aside.
Julienne the carrots and cucumber, thinly slice the bell peppers, and prepare any protein you're using.
Fill a shallow dish with warm water for soaking the rice paper.
Soak the Rice Paper:

Dip one rice paper wrapper into the warm water for about 10-15 seconds until it becomes pliable but not too soft. It will continue to soften as you assemble the wrap.
Assemble the Rice Wrap:

Place the softened rice paper on a clean, damp surface.
Arrange a small portion of rice vermicelli noodles, julienned vegetables, lettuce, herbs, and protein (if using) in the center of the rice paper.
Roll the Wrap:

Fold the sides of the rice paper over the filling.
Begin rolling from the bottom, tucking the filling as you roll.
Continue rolling until the rice paper is sealed.
Repeat:

Repeat the process with the remaining ingredients.
Prepare the Dipping Sauce:

In a bowl, mix soy sauce, hoisin sauce, peanut butter, lime juice, sesame oil, and crushed garlic. Adjust the quantities to achieve your desired flavor.
Serve:

Serve the rice wraps immediately with the dipping sauce on the side.
Enjoy your light and tasty rice wraps! Feel free to customize the filling based on your preferences.
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Frice%20wrap.jpg?alt=media&token=fc3f289f-8d02-4eda-927b-7d9132d9984e',
    'category': 'wrap',
  },
  {
    'title': 'Double X Burger',
    'time': '38',
    'description':
        'The burger is artfully layered with a medley of fresh, crisp ingredients. A generous spread of a special burger sauce, a tantalizing blend of creamy mayonnaise, tangy ketchup, and zesty Dijon mustard, sets the stage for a flavor explosion. Crisp lettuce adds a refreshing crunch, while juicy tomato slices bring a burst of succulence. Thin rings of red onion provide a subtle kick, harmonizing with the savory richness of the beef. ',
    'incredients': '''
     For the Patties:

1 pound ground beef (80% lean)
Salt and pepper to taste
1 teaspoon garlic powder
1 teaspoon onion powder
4 slices of your favorite cheese (cheddar, Swiss, or American)
For the Burger:

4 burger buns
1/2 cup mayonnaise
1/4 cup ketchup
1 tablespoon Dijon mustard
1 cup shredded lettuce
1 large tomato, sliced
1 red onion, thinly sliced
Pickles (optional)
    ''',
    'procedure': '''
        Prepare the Patties:

In a large mixing bowl, combine the ground beef with salt, pepper, garlic powder, and onion powder.
Divide the mixture into 8 equal portions and shape them into patties.
Cook the patties on a grill or stovetop over medium-high heat for about 4-5 minutes per side, or until they reach your desired level of doneness.
In the last minute of cooking, place a slice of cheese on each patty and allow it to melt.
Prepare the Burger Sauce:

In a small bowl, mix together mayonnaise, ketchup, and Dijon mustard to create the sauce.
Assemble the Double X Burger:

Toast the burger buns lightly.
Spread the burger sauce on the bottom half of each bun.
Place a lettuce leaf on top of the sauce.
Add a cooked patty with melted cheese on each bun.
Top with tomato slices, red onion rings, and pickles if desired.
Place the other half of the bun on top.
Serve and Enjoy:

Serve the Double X Burgers immediately while they're hot.
Consider serving with your favorite side dishes like fries or a crisp salad.
Feel free to adjust the ingredients and quantities based on your preferences. Enjoy your delicious Double X Burger!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2FDouble%20X.jpg?alt=media&token=560f3bae-3cfd-42b8-b4f3-14cc22dbaaae',
    'category': 'Burger',
  },
  {
    'title': 'veg Pizza',
    'time': '48',
    'description':
        'This vegetarian pizza is a delightful combination of a homemade, fluffy crust topped with a rich tomato sauce, gooey mozzarella cheese, and a vibrant array of colorful vegetables, including bell peppers, red onions, black olives, mushrooms, and cherry tomatoes. Finished with a sprinkle of fresh basil, this flavorful and satisfying pizza is a perfect choice for a wholesome and delicious meal.',
    'incredients': '''
     For the Pizza Dough:

2 1/4 teaspoons (1 packet) active dry yeast
1 teaspoon sugar
1 cup warm water (110°F/43°C)
3 cups all-purpose flour
1 teaspoon salt
2 tablespoons olive oil
For the Pizza Sauce:

1 can (14 oz) crushed tomatoes
2 cloves garlic, minced
1 teaspoon dried oregano
1 teaspoon dried basil
1/2 teaspoon salt
1/4 teaspoon black pepper
1 tablespoon olive oil
For the Toppings:

1 cup shredded mozzarella cheese
1/2 cup sliced bell peppers (red, green, yellow)
1/2 cup sliced red onions
1/2 cup sliced black olives
1/2 cup sliced mushrooms
1/2 cup cherry tomatoes, halved
Fresh basil leaves for garnish
    ''',
    'procedure': '''
        1. Prepare the Dough:
a. In a small bowl, combine warm water, sugar, and yeast. Let it sit for about 5 minutes until it becomes frothy.
b. In a large mixing bowl, combine flour and salt. Make a well in the center and add the yeast mixture and olive oil.
c. Mix until the dough comes together, then knead on a floured surface for about 5-7 minutes until smooth.
d. Place the dough in a greased bowl, cover with a damp cloth, and let it rise in a warm place for about 1-2 hours or until doubled in size.

2. Make the Pizza Sauce:
a. In a saucepan, heat olive oil over medium heat. Add minced garlic and sauté until fragrant.
b. Add crushed tomatoes, oregano, basil, salt, and pepper. Simmer for about 15-20 minutes until the sauce thickens.

3. Assemble and Bake:
a. Preheat your oven to 475°F (245°C).
b. Punch down the risen dough and roll it out on a floured surface to your desired thickness.
c. Transfer the rolled-out dough to a pizza stone or baking sheet.
d. Spread the pizza sauce over the dough, leaving a small border for the crust.
e. Sprinkle mozzarella cheese evenly over the sauce.
f. Add your desired vegetable toppings: bell peppers, red onions, black olives, mushrooms, and cherry tomatoes.
g. Bake in the preheated oven for 12-15 minutes or until the crust is golden and the cheese is melted and bubbly.
h. Remove from the oven and let it cool for a few minutes.
i. Garnish with fresh basil leaves before serving.

4. Serve and Enjoy:
Slice the veg pizza and serve hot. Enjoy your delicious homemade vegetarian pizza!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2FVeg%20pizza.jpg?alt=media&token=71db23be-74d5-4823-a39c-5095bedf20d1',
    'category': 'pizza',
  },
  {
    'title': 'Chicken Wrap',
    'time': '28',
    'description':
        'A delightful chicken wrap featuring seasoned and grilled chicken slices enveloped in a whole wheat or spinach tortilla. Topped with crisp lettuce, juicy tomatoes, crunchy cucumbers, and a blend of shredded cheese. Drizzled with a zesty mayonnaise and Greek yogurt sauce, this quick and easy recipe offers a perfect balance of flavors and textures in every bite. Customize with your favorite sauces or extras for a personalized touch. A delicious, portable meal for lunch or dinner that satisfies your cravings for a tasty and wholesome wrap experience.',
    'incredients': '''
    1 pound boneless, skinless chicken breasts, thinly sliced
2 tablespoons olive oil
1 teaspoon ground cumin
1 teaspoon paprika
1 teaspoon garlic powder
Salt and black pepper to taste
4 large whole wheat or spinach tortillas
1 cup shredded lettuce
1 cup diced tomatoes
1/2 cup diced cucumbers
1/2 cup shredded cheese (cheddar, Monterey Jack, or your choice)
1/4 cup mayonnaise
2 tablespoons Greek yogurt
1 tablespoon fresh lime juice
Optional: Salsa, hot sauce, or your favorite dressing
    ''',
    'procedure': '''
    Marinate the Chicken:

In a bowl, combine the sliced chicken breasts with olive oil, cumin, paprika, garlic powder, salt, and black pepper. Toss until the chicken is evenly coated. Let it marinate for at least 15-30 minutes to enhance the flavors.
Cook the Chicken:

Heat a skillet or pan over medium-high heat. Add the marinated chicken and cook until fully cooked and slightly browned, about 5-7 minutes. Stir occasionally to ensure even cooking.
Prepare the Sauce:

In a small bowl, mix mayonnaise, Greek yogurt, and lime juice. This will be the creamy sauce for your wrap.
Assemble the Wraps:

Warm the tortillas according to package instructions.
Lay out each tortilla and spread a portion of the creamy sauce in the center.
Place a generous portion of cooked chicken on top of the sauce.
Add Fresh Ingredients:

Sprinkle shredded lettuce, diced tomatoes, diced cucumbers, and shredded cheese over the chicken.
Optional Extras:

Add salsa, hot sauce, or your favorite dressing for an extra kick.
Fold and Serve:

Carefully fold the sides of the tortilla over the fillings and then fold the bottom and top to create a wrap.
Serve Warm:

Serve the chicken wraps immediately while they are still warm. You can also wrap them in parchment paper or foil for a portable meal.
Feel free to customize the ingredients and quantities based on your taste preferences. Enjoy your delicious homemade chicken wraps!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Fchickenwrap.jpg?alt=media&token=7f37c7e4-4a9b-40ac-8e45-028f46ca2eae',
    'category': 'wrap',
  },
  {
    'title': 'Beef Wrap',
    'time': '23',
    'description':
        'A Beef Wrap is a savory delight featuring thinly sliced, marinated beef enveloped in a soft tortilla. Complemented by a medley of fresh vegetables, such as lettuce, cucumber, and bell peppers, the wrap offers a perfect blend of textures and flavors. With a burst of aromatic herbs like cilantro, it a versatile and satisfying meal  both quick and delicious.',
    'incredients': '''
    For the Beef Filling:

1 pound (about 450g) thinly sliced beef (such as sirloin or flank steak)
2 tablespoons soy sauce
1 tablespoon olive oil
2 cloves garlic, minced
1 teaspoon ginger, grated
1 tablespoon hoisin sauce
1 tablespoon oyster sauce
1 teaspoon sesame oil
Salt and pepper to taste
For the Wrap Assembly:

4 large tortillas or flatbreads
1 cup shredded lettuce
1 cup thinly sliced cucumber
1 cup matchstick carrots
1/2 cup sliced red bell pepper
Fresh cilantro leaves for garnish
Optional: Sriracha or your favorite hot sauce for extra kick
    ''',
    'procedure': '''
     Marinate the Beef:

In a bowl, combine the sliced beef with soy sauce, olive oil, minced garlic, grated ginger, hoisin sauce, oyster sauce, sesame oil, salt, and pepper.
Mix well, ensuring the beef is evenly coated.
Let it marinate for at least 30 minutes to allow the flavors to infuse.
Cook the Beef:

Heat a skillet or wok over medium-high heat.
Add the marinated beef to the hot pan and stir-fry for 3-5 minutes or until the beef is cooked to your liking.
Remove from heat and set aside.
Prepare the Vegetables:

Slice the cucumber, bell pepper, and any other desired vegetables into thin strips or matchsticks.
Shred the lettuce and set aside.
Assemble the Wraps:

Warm the tortillas or flatbreads according to package instructions.
Lay out each tortilla and place a portion of the cooked beef in the center.
Add a layer of shredded lettuce, sliced cucumber, matchstick carrots, and bell pepper strips.
Garnish and Roll:

Drizzle with sriracha or your favorite hot sauce if desired.
Sprinkle fresh cilantro leaves over the vegetables.
Fold in the sides of the tortilla and then roll it tightly from the bottom, creating a wrap.
Serve:

Cut the wraps in half diagonally and serve immediately.
Optionally, serve with extra sauce or dressing on the side for dipping.
These beef wraps are versatile, and you can customize them with your favorite ingredients. Enjoy your delicious and satisfying beef wraps!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2FBeefwrap.jpg?alt=media&token=7dec8625-9e54-49c0-a978-26f2404b0127',
    'category': 'wrap',
  },
  {
    'title': 'Blue berry stick',
    'time': '18',
    'description':
        'Blueberry Stick Ice Cream is a delightful frozen treat that combines the sweet and tart flavors of blueberries with the creamy goodness of ice cream. The addition of a stick makes it a convenient and mess-free option for enjoying this refreshing dessert. Perfect for hot summer days or any time you crave a fruity and creamy indulgence.',
    'incredients': '''
    For the Blueberry Compote:

2 cups fresh or frozen blueberries
1/4 cup granulated sugar
2 tablespoons water
1 tablespoon lemon juice
1 teaspoon cornstarch (optional, for thickening)
For the Ice Cream Base:

2 cups heavy cream
1 cup whole milk
3/4 cup granulated sugar
1 teaspoon vanilla extract
For the Blueberry Swirl:

1/2 cup blueberry compote (from the above recipe)
For Assembling:

Popsicle molds or ice cream sticks
Crushed graham crackers or cookie crumbs (optional, for coating)
    ''',
    'procedure': '''
      1. Blueberry Compote:
a. In a saucepan, combine blueberries, sugar, water, and lemon juice.
b. Cook over medium heat, stirring occasionally, until the blueberries burst and the mixture thickens.
c. If desired, mix cornstarch with a little water and add it to the compote to thicken.
d. Remove from heat and let it cool completely.

2. Ice Cream Base:
a. In a mixing bowl, whisk together heavy cream, whole milk, sugar, and vanilla extract until the sugar dissolves.
b. Pour the mixture into an ice cream maker and churn according to the manufacturer's instructions until it reaches a soft-serve consistency.

3. Assembly:
a. Pour a layer of the ice cream base into the popsicle molds or small cups.
b. Add a spoonful of blueberry compote on top of the ice cream.
c. Repeat the layers until the molds are filled, finishing with a layer of ice cream on top.

4. Swirling:
a. Use a skewer or a small spoon to gently swirl the blueberry compote into the ice cream layers for a marbled effect.

5. Freezing:
a. Insert popsicle sticks into each mold or container.
b. Freeze the blueberry stick ice cream for at least 4-6 hours or until fully set.

6. Optional Coating:
a. If desired, before serving, roll the frozen blueberry stick ice cream in crushed graham crackers or cookie crumbs for added texture.

7. Enjoy:
a. Once fully frozen, remove the blueberry stick ice cream from the molds and indulge in this delicious frozen treat!

Now you have a tasty and visually appealing blueberry stick ice cream ready to be enjoyed!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Fblue%20berry.jpg?alt=media&token=ecb605f3-fd20-4ccb-9b0f-45c8e10a8a89',
    'category': 'Dessert',
  },
  {
    'title': 'Oreo shake',
    'time': '8',
    'description':
        'An Oreo shake is a delightful and indulgent beverage that combines the rich and creamy goodness of vanilla ice cream with the iconic chocolatey crunch of Oreo cookies. This classic shake is a perfect treat for anyone with a sweet tooth and is sure to satisfy your cravings for a deliciously cold and flavorful drink.',
    'incredients': '''
     10 Oreo cookies
2 cups vanilla ice cream
1 cup milk
2 tablespoons chocolate syrup (optional)
Whipped cream (optional)
Additional Oreo cookies for garnish (optional)
    ''',
    'procedure': '''
       Prepare the Ingredients:

Ensure that the vanilla ice cream is softened slightly, making it easier to blend.
Separate the Oreo cookies, keeping the cream filling intact. You'll use both the cookies and the cream in the shake.
Crush the Oreo Cookies:

Take 8 of the Oreo cookies and coarsely crush them. You can use a food processor or place the cookies in a plastic bag and crush them with a rolling pin. Set aside the remaining 2 cookies for garnish.
Blend the Shake:

In a blender, combine the softened vanilla ice cream, crushed Oreo cookies, Oreo cream filling, and milk.
Blend the mixture on high speed until smooth and creamy. If you prefer a thicker shake, you can add more ice cream. If you want a thinner consistency, add more milk.
Optional: Add Chocolate Syrup:

For an extra chocolatey kick, add chocolate syrup to the blender and blend again until well combined.
Serve the Oreo Shake:

Pour the Oreo shake into glasses.
If desired, top each glass with a dollop of whipped cream.
Garnish:

Crush the remaining 2 Oreo cookies and sprinkle the cookie crumbs over the whipped cream for a decorative touch.
Enjoy:

Grab a straw and indulge in the irresistible flavor of your homemade Oreo shake!
This recipe yields a delicious Oreo shake that combines the classic taste of vanilla and chocolate with the distinctive crunch of Oreo cookies. Feel free to customize the recipe to suit your preferences, whether it's by adjusting the thickness of the shake or adding extra toppings for that perfect finishing touch.
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Foreo.jpg?alt=media&token=6548de8e-4af0-44e8-abfa-53ef1ca0ca5f',
    'category': 'Dessert',
  },
  {
    'title': 'Rainbow cake',
    'time': '58',
    'description':
        'A rainbow cake is a vibrant and visually stunning dessert that features layers of brightly colored cake stacked together to resemble the colors of a rainbow. This delightful treat is perfect for special occasions, birthdays, or any event where you want to add a pop of color and joy to your celebration.',
    'incredients': '''
     For the Cake:

2 1/2 cups all-purpose flour
2 1/2 teaspoons baking powder
1/2 teaspoon baking soda
1/2 teaspoon salt
1 1/2 cups unsalted butter, softened
2 cups granulated sugar
4 large eggs
1 tablespoon vanilla extract
1 1/2 cups buttermilk
Food Coloring:

Red
Orange
Yellow
Green
Blue
Purple
For the Frosting:

3 cups confectioners' sugar
1 cup unsalted butter, softened
1 teaspoon vanilla extract
2-3 tablespoons heavy cream.
    ''',
    'procedure': '''
       For the Cake:

Preheat your oven to 350°F (175°C). Grease and flour three 8-inch round cake pans.
In a medium bowl, whisk together the flour, baking powder, baking soda, and salt. Set aside.
In a large mixing bowl, cream together the butter and sugar until light and fluffy.
Add the eggs one at a time, beating well after each addition. Stir in the vanilla extract.
Gradually add the dry ingredients to the wet ingredients, alternating with the buttermilk. Begin and end with the dry ingredients.
Divide the batter evenly into six bowls.
Add food coloring to each bowl to create the colors of the rainbow. Start with red, orange, yellow, green, blue, and purple.
Pour each colored batter into the prepared pans, one on top of the other.
Bake in the preheated oven for 25-30 minutes or until a toothpick inserted into the center comes out clean.
Allow the cakes to cool in the pans for 10 minutes, then transfer them to a wire rack to cool completely.
For the Frosting:

In a large mixing bowl, beat together the confectioners' sugar, butter, and vanilla extract until smooth and creamy.
Add heavy cream as needed to achieve the desired consistency.
Assembling the Cake:

Level the tops of the cooled cakes if necessary.
Place the purple layer on a serving plate and frost the top.
Add the blue layer and repeat the frosting.
Continue stacking the layers in rainbow order and frosting each layer.
Frost the sides and top of the assembled cake.
Optionally, decorate the cake with rainbow-colored sprinkles or additional decorations.
Slice and enjoy the burst of colors in every bite!
This rainbow cake is sure to be a showstopper at any celebration!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Frainbowcake.jpg?alt=media&token=c50b3b8c-f3ca-490f-b0dc-9131e2541679',
    'category': 'Dessert',
  },
  {
    'title': 'chicken Pizza',
    'time': '42',
    'description':
        'Chicken pizza is a flavorful and satisfying dish that combines a crispy homemade crust with savory toppings. Shredded seasoned chicken, vibrant bell peppers, onions, and mushrooms are layered on a bed of rich pizza sauce and melted mozzarella cheese. Baked to perfection, this homemade pizza is topped with a sprinkle of oregano for added aroma. Its a delicious and customizable treat that brings the classic pizzeria experience to your own kitchen.',
    'incredients': '''
    For the Pizza Dough:

2 1/4 teaspoons active dry yeast
1 teaspoon sugar
3/4 cup warm water (110°F/43°C)
2 cups all-purpose flour
1 teaspoon salt
1 tablespoon olive oil
For the Pizza Toppings:

1 cup cooked and shredded chicken (seasoned with salt and pepper)
1 cup pizza sauce
2 cups shredded mozzarella cheese
1/2 cup sliced red bell pepper
1/2 cup sliced green bell pepper
1/2 cup sliced red onion
1/2 cup sliced mushrooms
1/4 cup black olives, sliced
1 teaspoon dried oregano
1/2 teaspoon garlic powder
Crushed red pepper flakes (optional)
    ''',
    'procedure': '''
     For the Pizza Dough:

In a small bowl, combine the active dry yeast, sugar, and warm water. Let it sit for about 5-10 minutes, or until it becomes frothy.
In a large mixing bowl, combine the flour and salt. Make a well in the center.
Pour the yeast mixture into the well and add olive oil. Mix until a dough forms.
Knead the dough on a floured surface for about 5-7 minutes or until it becomes smooth and elastic.
Place the dough in a lightly oiled bowl, cover it with a damp cloth, and let it rise in a warm place for about 1-2 hours, or until it doubles in size.
Assembling the Pizza:

Preheat your oven to 475°F (245°C). If you have a pizza stone, place it in the oven during preheating.
Roll out the pizza dough on a floured surface to your desired thickness.
If using a pizza stone, transfer the rolled-out dough onto a piece of parchment paper.
Spread pizza sauce evenly over the dough, leaving a small border for the crust.
Sprinkle shredded mozzarella cheese over the sauce.
Distribute the shredded chicken and arrange the sliced vegetables on top.
Sprinkle dried oregano and garlic powder over the toppings.
If using a pizza stone, carefully transfer the parchment paper with the pizza onto the preheated stone. If not using a stone, place the pizza on a baking sheet.
Bake in the preheated oven for 12-15 minutes, or until the crust is golden and the cheese is melted and bubbly.
Remove the pizza from the oven and let it cool for a few minutes before slicing.
Optionally, sprinkle crushed red pepper flakes on top for some heat.
Enjoy your delicious homemade chicken pizza!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Fchicken%20pizza.jpg?alt=media&token=067496e5-c941-478d-9051-16aeceffec63',
    'category': 'pizza',
  },
  {
    'title': 'Orange punch',
    'time': '8',
    'description':
        'Refreshingly citrusy and sweet, this Orange Punch Drink is a vibrant and satisfying beverage that perfect for any occasion. Its zesty orange flavor, combined with a hint of tanginess, creates a thirst-quenching experience that will leave you wanting more.',
    'incredients': '''
    2 cups orange juice (freshly squeezed or store-bought)
1 cup pineapple juice
1/2 cup cranberry juice
1/4 cup lemon juice
1/4 cup simple syrup (adjust to taste)
2 cups ginger ale or sparkling water
Ice cubes
Orange slices and mint leaves for garnish (optional)
    ''',
    'procedure': '''
     Prepare the Base:

In a large pitcher, combine the orange juice, pineapple juice, cranberry juice, lemon juice, and simple syrup. Stir well to ensure the ingredients are thoroughly mixed.
Chill:

Place the pitcher in the refrigerator to chill for at least 1-2 hours. This allows the flavors to meld and the punch to become cold.
Add Sparkle:

Just before serving, pour in the ginger ale or sparkling water. This adds a fizzy and refreshing element to the punch.
Mix Gently:

Gently stir the punch to combine the ingredients without losing the carbonation.
Serve Over Ice:

Fill glasses with ice cubes and pour the orange punch over the ice.
Garnish (Optional):

Garnish each glass with orange slices and mint leaves for a decorative touch.
Enjoy:

Serve immediately and enjoy the bright and flavorful Orange Punch Drink!
This delightful punch is perfect for parties, gatherings, or simply as a tasty and hydrating treat on a warm day. Adjust the sweetness by adding more or less simple syrup according to your preference. Cheers to a refreshing burst of citrus goodness!
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Forange%20punch.jpg?alt=media&token=c83ae07d-862f-429b-bfb4-8c587a28a6bc',
    'category': 'Drinks',
  },
  {
    'title': 'Mint Lime',
    'time': '5',
    'description':
        'Mint Lime Cooler is a refreshing and vibrant drink that combines the zesty tang of fresh lime juice with the cooling essence of mint. Sweetened with a hint of mint-infused simple syrup, this thirst-quenching beverage is served over ice for a perfect balance of citrusy and herbal flavors. Garnished with fresh mint sprigs and lime slices, it an invigorating choice for warm days or a delightful addition to any occasion.',
    'incredients': '''
    1 cup fresh lime juice (about 8-10 limes)
1/2 cup fresh mint leaves, loosely packed
1/2 cup granulated sugar (adjust to taste)
4 cups cold water
Ice cubes
Mint sprigs and lime slices for garnish
    ''',
    'procedure': '''
     Prepare Lime Juice:

Squeeze the limes to extract fresh lime juice. You can use a citrus juicer to make this process easier.
Make Mint Simple Syrup:

In a small saucepan, combine 1/2 cup of water and the granulated sugar. Heat over medium heat, stirring until the sugar completely dissolves.
Once the sugar is dissolved, add the mint leaves to the syrup. Simmer for 1-2 minutes, then remove from heat. Allow the mint to steep in the syrup as it cools.
Strain Mint Simple Syrup:

Strain the mint leaves from the syrup using a fine mesh strainer or cheesecloth. You now have mint-infused simple syrup.
Mix Drink:

In a large pitcher, combine the fresh lime juice, mint-infused simple syrup, and cold water. Stir well to mix the ingredients thoroughly.
Adjust Sweetness:

Taste the mixture and adjust the sweetness by adding more sugar if needed. Stir until the sugar dissolves.
Chill:

Place the pitcher in the refrigerator and let the Mint Lime Cooler chill for at least 1-2 hours.
Serve:

Fill glasses with ice cubes and pour the chilled Mint Lime Cooler over the ice.
Garnish:

Garnish each glass with a sprig of fresh mint and a slice of lime.
Enjoy:

Stir before drinking to ensure the flavors are well combined. Enjoy your Mint Lime Cooler!
Feel free to adjust the quantities and sweetness to suit your taste preferences. This refreshing drink is perfect for warm days or as a delightful beverage for any occasion.
    ''',
    'photo':
        'https://firebasestorage.googleapis.com/v0/b/recipes-d05de.appspot.com/o/Burger%2Fmint%20lime.jpg?alt=media&token=cc508d4e-9f8a-45e1-88ba-da02940b4716',
    'category': 'Drinks',
  },
];
 
Future<void> addDatainitialy() async {
  final db = await Hive.openBox<Recipe>('recipes');
  if (db.isEmpty) {
    for (var Map in Data) {
      // ignore: unused_local_variable
      final model = Recipe(
        title: Map['title']!,
        photo: Map['photo']!,
        description: Map['description']!,
        procedure: Map['procedure']!,
        category: Map['category']!,
        favoritesUserIds: [],
        incredients: Map['incredients']!,
        time: Map['time']!,
      );
      await db.add(model);
    }
  }
}
