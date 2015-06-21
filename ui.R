#ui.R
library(shiny)
library(ggplot2)

trainData <- read.csv("./data/train.csv")

dataset <- trainData


shinyUI(fluidPage(
        navbarPage("Coursera Developing Data Products MOOC"
                   # navbarMenu("Links ",
                   #   		tabPanel$a(href = "https://www.kaggle.com/c/titanic-gettingStarted", "Kaggle Titanic Challenge"),
                   #   		tabPanel("Table")
                   #   	)
        ),
        titlePanel("Intro Kaggle's Titanic Challenge"),
        sidebarLayout(
                sidebarPanel(
                        
                        h3('Tweek the Plot'),
                        
                        sliderInput('sampleSize', 'Choose Sample Size', min=1, max=nrow(dataset),
                                    value=min(500, nrow(dataset)), step=100, round=0),
                        selectInput('x', 'X', names(dataset), selected = "Age"),
                        selectInput('y', 'Y', names(dataset), selected = "Pclass"),
                        selectInput('color', 'Color', selected = "Sex" , c('None', names(dataset))),
                        
                        checkboxInput('jitter', 'Jitter'),
                        checkboxInput('smooth', 'Smooth'),
                        
                        selectInput('facet_row', 'Facet Row', selected = "Survived", c(None='.', names(dataset))),
                        selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
                        downloadButton('downloadData', 'Download Train set'),
                        tags$br(),
                        tags$br(),
                        strong('VARIABLE DESCRIPTIONS:'),
                        tags$ul(
                                tags$li('survival - Survival (0 = No; 1 = Yes)'),
                                tags$li('pclass - Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)'),
                                tags$li('name - Name'),
                                tags$li('sex - Sex'),
                                tags$li('age - Age'),
                                tags$li('sibsp - Number of Siblings/Spouses Aboard'),
                                tags$li('parch - Number of Parents/Children Aboard'),
                                tags$li('ticket - Ticket Number'),
                                tags$li('fare - Passenger Fare'),
                                tags$li('cabin - Cabin'),    
                                tags$li('embarked - Port of Embarkation (C = Cherbourg; Q = Queenstown; S = Southampton)'),
                                tags$li('cabin - Cabin'), 
                                tags$li('cabin - Cabin')
                        ),  
                        strong('SPECIAL NOTES:'),
                        p(' Pclass is a proxy for socio-economic status (SES)'),
                        p('1st ~ Upper; 2nd ~ Middle; 3rd ~ Lower'),
                        p('Age is in Years; Fractional if Age less than One (1)'),
                        p('If the Age is Estimated, it is in the form xx.5'),
                        p('With respect to the family relation variables (i.e. sibsp and parch)
                          some relations were ignored.  The following are the definitions used
                          for sibsp and parch.'),
                        p('Sibling:  Brother, Sister, Stepbrother, or Stepsister of Passenger Aboard Titanic'),
                        p('Spouse:   Husband or Wife of Passenger Aboard Titanic (Mistresses and Fiances Ignored)'),
                        p('Parent:   Mother or Father of Passenger Aboard Titanic'),
                        p('Child:    Son, Daughter, Stepson, or Stepdaughter of Passenger Aboard Titanic'),
                        p('Other family relatives excluded from this study include cousins,
                          nephews/nieces, aunts/uncles, and in-laws.  Some children travelled
                          only with a nanny, therefore parch=0 for them.  As well, some
                          travelled with very close friends or neighbors in a village, however,
                          the definitions do not support such relations.')
                        
                        ),
                
                mainPanel(
                        h2('Basic Introductory Exploratory Analysis'),
                        p('Please note that this is a very basic App intended to provide some introductory (really, really basic) exploratory analysis.'),
                        p("It uses solely the training dataset on Kaggle's Titanic challenge, which you can download here, or on Kaggle's page:"),
                        a("https://www.kaggle.com/c/titanic-gettingStarted"),
                        #img(src ="./figures/titanic.png", height = 200, width = 200),
                        p('It is inspired on Trevor Stephens R tutorial, which I highly recommend if you are getting started to R:'),
                        a('http://trevorstephens.com/post/72916401642/titanic-getting-started-with-r'),
                        h4('Getting Started with this Web App'),
                        p('On the side panel you can change the variables that are injected to the plot (from ggplot2 library).'),
                        p('You can change which variable go the the X-axis, Y-axis, color by variable, and include jitter, smooth, and row/column facets.'),
                        p('Use it to your advantage in order to extract the maximum logic conclusions out of the plot for latter implementation of Machine Learning Algorithms.'),
                        strong('About the plot'),
                        p('The plot has already some variables choosen by default, to help you interprete the data.'),
                        p('From the default settings, the plot is intended to allow the comparison among some variables:'),
                        tags$ul(
                                tags$li('Compare the sex of the Survivors. Any prevaling?'),
                                tags$li('Compare the classes of Passengers. Any class with more survivors?'),
                                tags$li('Compare age of Passengers. Any prevaling?')
                        ),
                        
                        plotOutput('plot'),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        tags$br(),
                        h4('Training Dataset'),
                        p('Finally, you can view the raw training dataset and play with it as well.'),
                        tags$br(),
                        tabPanel('trainData', dataTableOutput('mytable1'))
                        
                )
                        )
                        ))