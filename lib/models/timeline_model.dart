import 'package:flutter/material.dart';


//subtitle data ...
List<List<String>> SubtitleData = [
    [
      'Launch the first edition of expressionism, Our Newsletter.',
      'Received a handsome grant from AICTE, Govt of India for various innovative ativities',
    ],

    [
      'Launch of the first edition of Expressionism, Our Newsletter.',
    ],

    [
       'VISHWAPRENEUR, a NAtional Level Enterpreneul Conversion, served as a dynamic platform for students to learn and interact with enterpreneurs.',
    ],

    [
      'First B-Plan compettion held with its grand prize pool',
    ],

    [
      'Participated in the Enatus National Compettion 2015, a unique competition 2015, a unique compettion based on the theme of social enterpreneurship',
    ],

    [
      "VISHWAPRENEUR extended it's reach globally by inviting Daniel Waples and Tausif Malik",
    ],

    [
      'Student Faciliation Centre an EDC start-up set a record distributing 70% of SFC kits.',
    ],

    [
       'Visits to Ashrams multiple times, understanding social needs and problems and trying to find solutions',
       'The cell incubes there innovative start-ups',
    ],

    [
      '4 New startups are currently working after successful b-plan compettion',
      'A new record was set as 800+ attendees participated', 
    ],

    [
       "Vishwapreneur'20 was hosted at GSK , where we surpased previous attendence records with over 2500 participants, settings a new standard",
    ],

    [
      'Embracethe change hosted an online e-summit featuring transformative knowledge and life-changing ideas',
    ],

    [
       'In the COVID-19 pandemic, conducted an online esummit with the prominent business tycoons and ministers',
    ],

    [
      'From a pool of 11 proposed start-ups, trackedemic was selected for EUREKA at IIT Bombay during the business Plan Compettion.',
      'The "E-cell Meetup" fosters enterpreneurial  spirit by uniting diverse E-Cells, enabling networking, knowlege exchange, and ideation for budding innovators.',
      "vishwapreneur'23, a decade-long enterpreneural journey at EDC, recorded its zenith with 800+ attendees",
    ],

    [
      'The Relaunch of the Corpstrata event with around the 600+ participants, the event organised by first year for the first year',
      "The vishwapreneur'24 describes the diversity among the guests of different domains",
    ],
];

// data model for timeline items....
class TimelineModel {
     final int year;
     final List<String> Title;
     final List<String> Subtitle;

     TimelineModel({required this.year, required this.Title, required this.Subtitle});
}


// list of timeline items......

List<TimelineModel> timelineData = [
     TimelineModel(year: 2008, Title: ['Foundation', 'AICTE Grant'], Subtitle: SubtitleData[0]),
     TimelineModel(year: 2012, Title: ['Newsletter'], Subtitle: SubtitleData[1]),
     TimelineModel(year: 2013, Title: ['Newsletter'], Subtitle: SubtitleData[2]),
     TimelineModel(year: 2014, Title: ['B-Plan'], Subtitle: SubtitleData[3]),
     TimelineModel(year: 2015, Title: ['Enactus'], Subtitle: SubtitleData[4]),
     TimelineModel(year: 2016, Title: ['International Guests'], Subtitle: SubtitleData[5]),
     TimelineModel(year: 2017, Title: ['SFC'], Subtitle: SubtitleData[6]),
     TimelineModel(year: 2018, Title: ['Socialpreneur', 'Startups'], Subtitle: SubtitleData[7]),
     TimelineModel(year: 2019, Title: ['B-Plan', 'Vishwapreneur'], Subtitle: SubtitleData[8]),
     TimelineModel(year: 2020, Title: ["Vishwapreneur'20"], Subtitle: SubtitleData[9]),
     TimelineModel(year: 2021, Title: ["Excelsior"], Subtitle: SubtitleData[10]),
     TimelineModel(year: 2022, Title: ["Vishwapreneur'22"], Subtitle: SubtitleData[11]),
     TimelineModel(year: 2023, Title: ["Agnitio", 'E-cell Meetup'], Subtitle: SubtitleData[12]),
     TimelineModel(year: 2024, Title: ["CorpStrata", 'E-cell Meetup'], Subtitle: SubtitleData[13]),
];