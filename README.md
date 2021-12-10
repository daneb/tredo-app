# Tredo Rails App

A component-based Rails application

### Design Goals

1. Seams to ease maintenance, refactors, micro-service transformation
2. Clear boundaries of responsibility and domain
3. Ease of comprehension with independent units that are testable

### Key Resources

1. [Rails Style Guide](https://rails.rubystyle.guide/)
2. [Component-based architecture](https://cbra.info/)
3. [Between Monolith and Microservices](https://noti.st/palkan/VWPOSd/between-monoliths-and-microservices)

### Caveats

1. I'm no RAILS expert - so I would fall flat in terms of the DSL. I did however make best ever to follow the [Rails Style Guide](https://rails.rubystyle.guide/) and best practices in areas I touched.
2. In terms of seams I used [component-based rails](https://cbra.info). This work is 4 years old and not perfect. Modular Rails appears to me as hard problem to solve as I scoured the internet. I stumbled onto Engems but even then (still 2 years back) and complexity in the generators. This ALL makes sense given the design intent - "majestic monolith".
3. Being a back-end developer I made some compromises:
   - Bypassed setup of Bootstrap into the application using a CDN
   - Didn't make use of sass/less
   - Didn't centralize use of CSS to
4. DB is not disabled in Rails

### Business Logic

1. Business Logic lives entirely inside the gem
