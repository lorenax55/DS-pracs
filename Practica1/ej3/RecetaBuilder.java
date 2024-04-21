

public abstract class RecetaBuilder {
    protected Receta receta;

    public Receta getReceta() {
        return receta;
    }

    public abstract void BuildIngredientes();
    public abstract void BuildPasos();
    public abstract void BuildTiempo();
}