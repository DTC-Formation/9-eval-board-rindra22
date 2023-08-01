class Status{
    final String name;

    Status(this.name);

    static List<Status> getStatus(){
        return <Status>[
            Status('En cours'),
            Status(('Bloqué')),
           // Status('En attente'),
            Status('Terminé'),
        ];
    }
}