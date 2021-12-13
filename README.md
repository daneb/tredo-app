# Tredo Rails App 🥷

A component-based Rails application

### Design Goals

1. Seams to ease maintenance, refactors, micro-service transformation (flexibility)
2. Clear boundaries in terms of the domain (responsibility)
3. Ease of comprehension with independent units that are testable (maintenance)

### Design decisions

#### Why a gem?

1. [Tredo](https://rubygems.org/gems/tredo) provides a seam that could be migrated to a separate service.
2. The gem is also agnostic to RestClient (to some degree). Exceptions would need a little more work for true agnosticism.
3. The gem allows multiple providers (Trello, Todoist etc) through the Provider modal, and supports the use of a consistent business domain language that abstracts the complexity and differences of the providers.
4. More can be found [here](https://github.com/daneb/tredo)

#### Why a Component-based Rails app?

🧨 _Disclaimer_: I struggled to find the right approach to a Component-based Rails app (as I mentioned below in more detail), so this is best effort and not complete, but a representation of an attempt at modular design for

- ease of testing
- maintenance
- decomposition in the future
- strangling technical debt etc.

The CBRA is achieved through creating engines (components) and a move away from /app.

### Style Designs

Even though it's largely for Rails 4+ I leaned on the[] Rail Style Guide](https://rails.rubystyle.guide)

One of my design decisions was to not go with a **model**, and I found support for the reasoning below for using a Helper to transform and fetch external data.

1. [Model Business Logic](https://rails.rubystyle.guide/#models)
2. [When to use Helpers vs Models](https://geek-qa.imtqy.com/questions/206211/index.html)
3. [Rails Helpers](https://www.rubyguides.com/2020/01/)

#### Tredo Gem

1. The work around the HTTP calls to Trello etc. are in the [Tredo gem](https://rubygems.org/gems/tredo).
2. The Gem is unit tested (not as thoroughly as I would like around all decision paths).
3. The Gem returns a standardized Jsender response for all errors in the following format:

```json
Jsender::Json.success
 => "{\"status\":\"success\",\"data\":null}"

Jsender::Json.failure
 => "{\"status\":\"fail\",\"data\":{\"message\":\"A failure has occurred\"}}"

Jsender::Json.error
 => "{\"status\":\"error\",\"message\":\"An error has occurred\"}"
```

4. The Gem uses Rails credentials to be fed the Trello Token and API Key

### Caveats

1. Not YET a rails 🛤 expert - so I fall flat in terms of the DSL nuances and uses-cases. I did however make best effort to follow the [Rails Style Guide](https://rails.rubystyle.guide/) and best practices in areas I touched.
2. [ ] In terms of seams I used [component-based rails](https://cbra.info). This concept is 4 years old and not perfect. Modular Rails appears to me a hard problem to solve as I scoured the internet. I stumbled onto Engems but even then (still 2 years back) and complexity in the generators. This ALL makes sense given the design intent - "majestic monolith". [Hanami](https://guides.hanamirb.org/v1.3/architecture/overview/), origionally known as Lotus.RB, lends itself to a clean architecture.
3. I'm largely a back-end engineer 🤓.

### What would I have done differently?

1. Added tests to the Rails app (for the Helper) and UI automation testing
2. Added more tests to the gem, I didn't cover all decision paths (but got the meat)
3. Added CI (there's a missing pipeline for the tests)
4. Front-end:
   - Bypassed setup of Bootstrap into the application using a CDN
   - Didn't make use of sass/less
   - Didn't centralize use of CSS
   - No tests (only tests in the Tredo Gem)
5. Back-end:
   - Battle-tested component-based design in terms of migrations, webpack and tests.
   - Fixed the issue with Sprockets being a hard dependency on /app
6. Disabled the use of the DB in Rails.
7. More resiliency around error handling and support in the DashboardHelper.
8. I think the code could be a-lot cleaner all round. A few more refactors and it could be much more condense. I particularly didn't like the non-DRY interface for Tredo gem.
9. DRY up the validation in the Gem

### Development Setup

1. As per requirement webhook support through Ngrok.

```sh
# ngrok http 4040
```

2. Tredo app will need to bundle installs:

```sh
$ cd components/todo-component/
$ bundle install

// In root of web app
$ bundle install
```

3. Tredo Gem is part of todo-component gemspec.

### Key Resources

1. [Rails Style Guide](https://rails.rubystyle.guide/)
2. [Component-based architecture](https://cbra.info/)
3. [ ] [Between Monolith and Microservices](https://noti.st/palkan/VWPOSd/between-monoliths-and-microservices)
       .4 [Modular Rails Engems](https://github.com/palkan/engems)
