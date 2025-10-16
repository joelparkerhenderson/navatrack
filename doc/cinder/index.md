# How to change from a Phoenix table into a Cinder table

This is typically for LiveView files such as `index_live.ex`.

From Phoenix table markup such as:

```heex
<.table id="xx" rows={@xx}>
    <:col :let={x} label="Id"><.link_show x={x} /></:col>
    <:col :let={x} label="Name">{x.name}</:col>
    <:col :let={x} label="Status">{x.status}</:col>
</.table>
```

Into Cinder table markup such as:

```heex
<Cinder.Table.table theme={Cinder.Themes.Smart} resource={X}>
    <:col :let={x} field="id" label="Id" filter sort search><.link_show x={x} /></:col>
    <:col :let={x} field="name" label="Name" sort search>{x.name}</:col>
    <:col :let={x} field="status" label="Status" sort search>{x.status}</:col>
</Cinder.Table.table>
```
