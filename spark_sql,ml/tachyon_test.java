package test;

// tachyon 读写文件实战过程 ，hdfs，tachyon ,spark,hive,hbase ,java ,scala 编程 语言必须学会，

import java.io.IOException;

import tachyon.TachyonURI;
import tachyon.client.FileOutStream;
import tachyon.client.InStream;
import tachyon.client.ReadType;
import tachyon.client.TachyonFS;
import tachyon.client.TachyonFile;
import tachyon.client.WriteType;

public class tachyon_test {
    public final static TachyonURI masteruri = new TachyonURI("tachyon://localhost:19998");
    public final static TachyonURI filepath = new TachyonURI("/tmp/test");
    public static WriteType writeType = WriteType.CACHE_THROUGH;
    public static ReadType readType = ReadType.CACHE;

    public static void writeFile() throws IOException {
        TachyonFS tachyonClient = TachyonFS.get(masteruri);
        if (tachyonClient.exist(filepath)) {
            tachyonClient.delete(filepath, true);
        }
        tachyonClient.createFile(filepath);
        TachyonFile file = tachyonClient.getFile(filepath);
        FileOutStream os = (FileOutStream) file.getOutStream(writeType);
        for (int i = 0; i < 10; i++) {
            os.write(Integer.toString(i).getBytes());
        }
        os.close();
        tachyonClient.close();
    }

    public static void readFile() throws IOException {
        TachyonFS tachyonClient = TachyonFS.get(masteruri);
        TachyonFile file = tachyonClient.getFile(filepath);
        InStream in = file.getInStream(readType);
        byte[] bytes = new byte[20];
        in.read(bytes);
        System.out.println(new String(bytes));
        in.close();
        tachyonClient.close();
    }

    public static void main(String[] args) throws IOException {
        writeFile();
        readFile();
    }
}
