---
description: 这是设计模式笔记.
---

# 设计模式

#### 代理模式

_介绍:_  
      在代理模式（Proxy Pattern）中，一个类代表另一个类的功能。这种类型的设计模式属于结构型模式,在代理模式中，我们创建具有现有对象的对象，以便向外界提供功能接口.

_实现原理:_  
　　我们将创建一个 Image 接口和实现了 Image 接口的实体类。ProxyImage 是一个代理类，减少 RealImage 对象加载的内存占用,ProxyPatternDemo，我们的演示类使用 ProxyImage 来获取要加载的 Image 对象，并按照需求进行显示。

_例子:_  
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



