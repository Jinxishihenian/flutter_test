---
description: 这是设计模式笔记.
---

# 设计模式

#### 代理模式

例子:

image接口:

```java
/// image接口.
interface Image {
  void display();
}

```

实现image接口实体类:

```java
/// 创建实现接口的实体类.
class RealImage implements Image{
    private String fileName;
	
    public RealImage(String fileName){
	    this.fileName = fileName;
		loadFromDisk(fileName);
	}
	
	@Override 
	public void display(){
		System.out.println("Displaying"+fileName);
	}
	
	private void loadFromDisk(String fileName){
	    System.out.println("Loading"+fileName);
	}
}
```

realImage实体类的代理类:

```java
/// 代理接口ProxyImage.
class ProxyImage implements Image{
	private RealImage realImage;
	private String fileName;
	
	public ProxyImage(String fileName){
		this.fileName = fileName;
	}
	
	@Override 
	public void display(){
		if(realImage == null){
		   realImage = new RealImage(fileName);
		}
		realImage.display();
	}
	
}

```

代理类的实现:

```java
public class HelloWorld {
    public static void main(String []args) {
        System.out.println("Hello World!");
		Image image = new ProxyImage("test_10mb.jpg");
		// 图像将从磁盘加载.
		image.display();
		System.out.print("");
		// 图像不需要从磁盘加载.
		image.display();
    }
}
```



