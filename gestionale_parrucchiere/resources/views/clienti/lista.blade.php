<h1>Lista Clienti</h1>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome e Cognome</th>
        <th>Telefono</th>
        <th>Email</th>
        <th>Scheda Tecnica</th>
    </tr>
    @foreach($clienti as $cliente)
    <tr>
        <td>{{ $cliente->id_cliente }}</td>
        <td>{{ $cliente->cognome_nome }}</td>
        <td>{{ $cliente->telefono }}</td>
        <td>{{ $cliente->email }}</td>
        <td>{{ $cliente->scheda_tecnica }}</td>
    </tr>
    @endforeach
</table>