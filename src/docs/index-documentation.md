# Documentation

Welcome to the getML technical documentation. This documentation is written for data
scientists who want to use the getML software suite for their projects. For
business information about getML, visit [getml.com](https://getml.com). You can also [contact us](https://www.getml.com/contact) for any questions or inquiries.



## GetML in one minute

getML is an innovative tool for the end-to-end automation of data
science projects. It covers everything from convenient data loading procedures
to the deployment of trained models.

Most notably, getML includes advanced algorithms for
**automated feature engineering** (feature learning) on relational data and time
series. Feature engineering on relational data is defined as the creation of a
flat table by merging and aggregating data. It is sometimes also referred to
as **data wrangling**. Feature engineering is necessary if your data is distributed
over more than one data table.

Automated feature engineering

* Saves up to 90% of the time spent on a data science project
* Increases the prediction accuracy over manual feature engineering

Andrew Ng, Professor at Stanford
University and Co-founder of Google Brain described manual feature engineering as follows:

> *Coming up with features is difficult, time-consuming, requires expert
> knowledge. "Applied machine learning" is basically feature engineering.*

The main purpose of getML is to automate this *"difficult, time-consuming"* process as much
as possible.

getML comes with a high-performance **engine** written in C++ and an intuitive
**Python API**. Completing a data science project with getML consists of eight
simple steps.

1. Launch the engine
```python
import getml

getml.engine.launch()
getml.engine.set_project('one_minute_to_getml')
```

2. Load the data into the engine
```python
df_population = getml.data.DataFrame.from_csv('data_population.csv',
            name='population_table')
df_peripheral = getml.data.DataFrame.from_csv('data_peripheral.csv',
            name='peripheral_table')
```
3. Annotate the data
```python
df_population.set_role(cols='target', role=getml.data.role.target)
df_population.set_role(cols='join_key', role=getml.data.role.join_key)
```

4. Define the data model
```python
dm = getml.data.DataModel(population=df_population.to_placeholder())
dm.add(df_peripheral.to_placeholder())
dm.population.join(
   dm.peripheral,
   on="join_key",
)
```

5. Train the feature learning algorithm and the predictor
```python
pipe = getml.pipeline.Pipeline(
    data_model=dm,
    feature_learners=getml.feature_learning.FastProp(),
    predictors=getml.predictors.LinearRegression()
)
pipe.fit(
    population=df_population,
    peripheral=[df_peripheral]
)
```

6. Evaluate
```python
pipe.score(
    population=df_population_unseen,
    peripheral=[df_peripheral_unseen]
)
```

7. Predict 
```python  
pipe.predict(
    population=df_population_unseen,
    peripheral=[df_peripheral_unseen]
)
```

8. Deploy
```python
# Allow the pipeline to respond to HTTP requests
pipe.deploy(True)
```

Check out the rest of this documentation to find out how getML achieves top
performance on real-world data science projects with many tables and complex
data schemes.


## How to use the documentation

If you want to get started with getML right away, we recommend to follow the
[installation instructions][installation-index] and then go through the
[getting started guide][getting-started]. 

If you are looking for more detailed information, other sections of this
documentation are more suitable:

- [Examples][examples-index]
  
    The examples section contains real-world getML projects using public datasets for easy follow-along. It showcases getML’s capabilities in feature engineering and predictive modeling, with practical demonstrations available in the [getml-demo](https://github.com/getml/getml-demo) repository on GitHub. You’ll find templates for your projects and a guide on integrating getML with FastAPI to create prediction endpoints.


- [User guide][user-guide]

    The user guide explains all conceptional details behind getML in
    depth. It can serve as a reference guide for experienced users but it's also
    suitable for first day users who want to get a deeper understanding
    of how getML works. Each chapter in the
    user guide represents one step of a typical data science project.

- [API reference][python-api]

    The API reference covers everything related to the Python
    interface to the getML engine. Each module comes with a dedicated
    section that contains concrete code examples.


You can also check out our [blog articles and case studies](https://www.getml.com/blog). 