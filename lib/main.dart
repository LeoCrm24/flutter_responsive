import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Teams',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TeamList(),
    );
  }
}

class TeamList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Team> championsLeagueTeams =
        teams.where((team) => team.competition == 'Champions League').toList();
    List<Team> ligaMxTeams =
        teams.where((team) => team.competition == 'Liga MX').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Football Teams'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TeamSection(title: 'Champions League', teams: championsLeagueTeams),
            TeamSection(title: 'Liga MX', teams: ligaMxTeams),
          ],
        ),
      ),
    );
  }
}

class TeamSection extends StatelessWidget {
  final String title;
  final List<Team> teams;

  const TeamSection({
    Key? key,
    required this.title,
    required this.teams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var team in teams)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TeamCard(team: team),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(team.logo),
              radius: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                team.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(team.description),
            ),
          ],
        ),
      ),
    );
  }
}

class Team {
  final String name;
  final String logo;
  final String description;
  final String competition;

  Team({
    required this.name,
    required this.logo,
    required this.description,
    required this.competition,
  });
}

List<Team> teams = [
  Team(
    name: 'FC Barcelona',
    logo:
        'https://cdn.pixabay.com/photo/2017/05/14/11/33/football-2311831_1280.png',
    description: 'Club de fútbol español con sede en Barcelona.',
    competition: 'Champions League',
  ),
  Team(
    name: 'Real Madrid',
    logo:
        'https://cdn.pixabay.com/photo/2017/05/14/11/36/football-2311841_1280.png',
    description: 'Club de fútbol español con sede en Madrid.',
    competition: 'Champions League',
  ),
  Team(
    name: 'Bayern Miunchen',
    logo:
        'https://cdn.pixabay.com/photo/2017/08/30/16/01/football-2697618_1280.jpg',
    description: 'Equipo sobrevalorado',
    competition: 'Champions League',
  ),

  // LIGA MX

  Team(
    name: 'Cruz Azul',
    logo:
        'https://cdn.pixabay.com/photo/2024/04/17/22/13/rabbit-8703128_1280.png',
    description: 'Club de fútbol mexicano con sede en Mexico.',
    competition: 'Liga MX',
  ),
  Team(
    name: 'América',
    logo:
        'https://cdn.pixabay.com/photo/2017/06/09/09/39/adler-2386314_1280.jpg',
    description: 'Club de fútbol mexicano con sede en Ciudad de México.',
    competition: 'Liga MX',
  ),
];
