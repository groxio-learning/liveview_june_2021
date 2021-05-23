# LiveView June 2021 class info. Your homework. 

## 1 Install these tools, plus Elixir, plus Phoenix. 

The tools you will need to install: 

- zoom 
- git (https://git-scm.com/downloads). 
- an editor that you are comfortable with. 
- a working PostgreSQL install

For the development dependencies, you'll need: 

- Elixir 1.11, with OTP 23. Make sure it's working: 

run the command: 

```
[clock] ➔ elixir -v
Erlang/OTP 23 [erts-11.0] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]

Elixir 1.11.2 (compiled with Erlang/OTP 23)
```

- node.js. Not optional! for Phoenix assets (I'm running npm -v 6.13.4)
- Phoenix 1.5.7+ (It includes LiveView.)


Is Phoenix working? Make sure you can run this command: 

```
mix phx.new demo --live
(say yes to fetch dependencies and assets)
```

and make sure you can then create the database: 

```
cd demo
mix ecto.create
```

Don't save this for the last minute! There are a few dependencies that will give you trouble if you've never done this before and decide to wait. 


## 2. Clone this repository

1. Fork this repository to your github account. 

- Go to https://github.com/groxio-learning/liveview_june_2021
- Click the `fork` button in the upper right corner
- Navigate to *your local version* (at something like git@github.com:your-github-user/liveview_june_2021.git. )
- Copy the clone address to your clipboard. In the upper right, click `clone or download` then `copy to clipboard`

2. Clone your local version to your local machine. 

- Clone it. *REPLACE your-github-account with your account*:  

```
>  git clone <paste the url>
...clones repo...
cd liveview_june_2021
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/liveview_june_2021.git (fetch)
> origin  https://github.com/your-user/liveview_june_2021.git (push)
```


- If there's no origin, set it. Make sure you *replace your-github-user*:

```
liveview_june_2021> git remote add origin https://github.com/your-github-user/liveview_june_2021.git
```

- Verify your remote: 

```
$ git remote -v
> origin  https://github.com/your-user/liveview_june_2021.git (fetch)
> origin  https://github.com/your-user/liveview_june_2021.git (push)
```

- Set the upstream to the Groxio repo:

```
liveview_june_2021> git remote add upstream https://github.com/groxio-learning/liveview_june_2021.git
```

- Verify the remotes: 

```
> origin  https://github.com/your-user/liveview_june_2021.git (fetch)
> origin  https://github.com/your-user/liveview_june_2021.git (push)
> upstream  https://github.com/groxio-learning/liveview_june_2021.git (fetch)
> upstream  https://github.com/groxio-learning/liveview_june_2021.git (push)
```

3. Now check out your setup. Send me a pull request: Edit the file "pull_requests.md" and add your name: 

- git pull upstream main
- Edit pull_requests.md

```
1. Bruce Tate
2. 
3. 
4. Horasmas B. Dragon
5. 
6. 
```

Hint: If you add your name somewhere in the middle of the list, chances of a merge are lower. 

- Commit the file and push

```
> git commit . -m "my commit"

...some happy success message...

> git push origin main

...some happy success message...
```

Now go to your repo online. Click: "Compare and create pull request" 

Your homework is done!
