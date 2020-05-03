package indi.zx.mall.pojo;

public class Query {
   private String custName;
   private  String custSource;
   private  int stutas;

    public int getStutas() {
        return stutas;
    }

    public void setStutas(int stutas) {
        this.stutas = stutas;
    }

    private int page=1;
   private int size=15;

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustSource() {
        return custSource;
    }

    public void setCustSource(String custSource) {
        this.custSource = custSource;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
