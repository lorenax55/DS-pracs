public class Receta {
    private String ingredientes;
    private String pasos;
    private int tiempoPreparacion;

    public Receta(String ingredientes, String pasos, int tiempoPreparacion) {
        this.ingredientes = ingredientes;
        this.pasos = pasos;
        this.tiempoPreparacion = tiempoPreparacion;
    }
    public Receta() {
        this.ingredientes = "";
        this.pasos = "";
        this.tiempoPreparacion = 0;
    }

    public void setIngredientes(String ingredientes) {
        this.ingredientes = ingredientes;
    }

    public void setPasos(String pasos) {
        this.pasos = pasos;
    }

    public void setTiempoPreparacion(int tiempoPreparacion) {
        this.tiempoPreparacion = tiempoPreparacion;
    }
    public String getIngredientes() {
        return ingredientes;
    }

    public String getPasos() {
        return pasos;
    }

    public int getTiempoPreparacion() {
        return tiempoPreparacion;
    }
}
