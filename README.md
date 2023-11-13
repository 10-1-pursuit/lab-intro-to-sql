# SQL Regifter pt 2



Which resource did you choose to use?
Honestly, I jumped right into football stats cuz i wanted to see if i could figure it out. I was quickly overwhelmed so now ive gone to SQL ZOO and its bookmarked.

What are three things you learned during this lab?


1. its SO unforgiving, I dont know what but it just looks diffrent and therefore its hard to see whats wrong.
2. CHAT GPT is great but it knows many diffrent ways to sort and join information--too many. gotta stay away from till i get more comfortable.
3. I still dont get creating the reference? do we make them? if so--my tuner app needs more help lol








# Regftr

![](https://rlv.zcache.com.au/reduce_reuse_regift_funny_christmas_6_cm_round_badge-r9911a7f1e4874b11853faf94371908ec_k94rf_307.jpg?rlvnet=1)

An unfortunate occurrence is happening with increasing frequency. Friendships and trust are being torn asunder. The social fabric of many co-workers, friends and even families is fraying and tumbling into chaos. Too many times, gifts are regifted to the original gift-giver!

You think to yourself, there has to be a way to help! To make things better... with a database!

## Getting Started

**terminal**

- fork and clone this repository
- `cd` into to directory
- `ls` make sure you see the file `regifter.sql`
- `psql`
- `\i regifter.sql` to run the file `regifter.sql`

**SUCCESS**

![](./assets/getting-started.png)

## Activity

Open the `regifter.sql` file with your text editor

There is a prompt for each SQL command you should write. `\echo` will print the instructions ot he console.

```sql\d 
--
\echo Query for all the columns in your gifts table
--

```

You will write your code right below each prompt

```sql
--
\echo Query for all the columns in your gifts table
--
SELECT * FROM gifts;
--
```

**Output:**

![](./assets/example-query.png)

Remember to press `\q` to quit out of `psql`
