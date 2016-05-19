import java.io.Serializable ;
import scala.math.Ordered ;
/**
 * Created by ruige on 2016/1/26.
 */

public class SecondSortKey implements Ordered<SecondSortKey>,Serializable{
    private int first;
    private int second ;
    // 二次排序的公开构造器
    public SecondSortKey(int first,int second ){
        this.first = first;
        this.second = second ;
    }



    @Override
    public boolean $less(SecondSortKey other) {
        if (this.first<other.getFirst()){
            return true ;
        }else if (this.first == other.getFirst() && this.second < other.getSecond()){
            return true ;
        }
        return false ;
    }

    public boolean $greater(SecondSortKey other){
        if (this.first >other.getFirst()){
            return true ;
        }else if (this.first == other.getFirst() && this.second >other.getSecond()){
            return true ;
        }
        return false ;
    }

    @Override
    public boolean $less$eq(SecondSortKey other) {
        if (this.$less(other)){
            return true ;
        }else if(this.first ==other.getFirst()&& this.second==other.getSecond()){
            return true ;
        }
        return false ;
    }



    @Override
    public boolean $greater$eq(SecondSortKey other) {
        if (this.$greater(other)){
            return true ;
        }else if(this.first ==other.getFirst()&& this.second==other.getSecond()){
            return true ;
        }
        return false ;
    }
    @Override
    public int compare(SecondSortKey other) {
        if (this.first-other.getFirst() !=0){
            return this.first-other.getFirst();
        }else  {
            return this.second-other.second ;
        }
    }
    @Override
    public int compareTo(SecondSortKey other) {
        if (this.first-other.getFirst() !=0){
            return this.first-other.getFirst();
        }else  {
            return this.second-other.second ;
        }
    }
    public int getFirst(){
        return first ;
    }

    public int getSecond() {
        return second;
    }
    public void setFirst(int first) {
        this.first = first;
    }

    public void setSecond(int second) {
        this.second = second;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SecondSortKey)) return false;

        SecondSortKey that = (SecondSortKey) o;

        if (getFirst() != that.getFirst()) return false;
        return getSecond() == that.getSecond();

    }

    @Override
    public int hashCode() {
        int result = getFirst();
        result = 31 * result + getSecond();
        return result;
    }
}
