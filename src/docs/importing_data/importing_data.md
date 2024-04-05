# Importing data

Before being able to analyze and process your data using the getML software,
you have to import it into the engine. At the end of this step, you will have
your data in data frame objects in the getML engine and will be ready to
[annotate them](#annotating).

> __Note__:
> 
> If you have imported your data into the engine before and want to restore it,
> refer to [the getML Python API lifecycles dataframe](the_getml_python_api_lifecycles_dataframe)

## Unified import interface

The getML Python API provides a unified import interface requiring
similar arguments and resulting in the same output format, regardless
of the data source.

You can use one of the dedicated
[`from_csv()`](getml/data/DataFrame/from_csv),
[`from_pandas()`](getml/data/DataFrame/from_pandas),
[`from_db()`](getml/data/DataFrame/from_db), and
[`from_json()`](getml/data/DataFrame/from_json) class methods to construct a
data frame object in the getML engine, fill it with the provided data,
and retrieve a [`DataFrame`](getml/data/DataFrame) handle in the Python
API. 

If you already have a data frame object in place, you
can use the [`read_csv()`](getml/data/DataFrame/read_csv),
[`read_pandas()`](getml/data/DataFrame/read_pandas),
[`read_db()`](getml/data/DataFrame/read_db), or
[`read_json()`](getml/data/DataFrame/read_json) methods of the corresponding
[`DataFrame`](getml/data/DataFrame) handle to either replace its content
with new data or append to it.

All those functions also have their counterparts for exporting called
[`to_csv()`](getml/data/DataFrame/to_csv),
[`to_pandas()`](getml/data/DataFrame/to_pandas),
[`to_db()`](getml/data/DataFrame/to_db), and
[`to_json()`](getml/data/DataFrame/to_json).

The particularities of the individual formats will be covered in the
following sections:

- CSV interface
- Pandas interface
- JSON interface
- SQLite3 interface
- MySQL interface
- MariaDB interface
- PostgreSQL interface
- Greenplum interface
- ODBC interface

## Data Frames

The resulting [`DataFrame`](getml/data/DataFrame) instance in the Python
API represents a handle to the corresponding data frame object in the
getML engine. The mapping between the two is done based on
the name of the object, which has to be unique. Similarly, the names of 
the [`columns`](getml/data/columns) are required to be
unique within the data frame they are associated with.

## Handling of NULL values

Unfortunately, data sources often 
contain missing or corrupt data - also called NULL
values. getML is able to work with missing values except for the
[target variable](#annotating_roles_target), which must not
contain any NULL values (because having NULL targets does not
make any sense). Please refer to the section on 
[join keys](#annotating_roles_join_key) for
details about their handling during the construction of the data
model.

During import, a NULL value is automatically inserted at all
occurrences of the strings "nan", "None", "NA", or an empty string as
well as at all occurrences of `None` and `NaN`.
