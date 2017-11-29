package com.hellozhu.ServiceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.hellozhu.Dao.ArticleDao;
import com.hellozhu.DaoImpl.ArticleDaoImpl;
import com.hellozhu.Service.ArticleService;
import com.hellozhu.model.Article;

public class ArticleServiceImpl implements ArticleService {
	private ArticleDao articledao=new ArticleDaoImpl();

	@Override
	public void add(String content,Article article,File cover) {
/*		
 * 文章在本地磁盘上的处理
*/		
		   StringBuilder path=new StringBuilder();
		   path.append("D:\\FileDemo");//保存生成Html文件的目录
		 // System.out.println(path.length());
		   File file1;
		   String str=null;
		  
		   Date todaytime=new Date();
		   SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
		   SimpleDateFormat ttime=new SimpleDateFormat("yyyyMMddhhMMSS");
		   String name =ttime.format(todaytime);//生成当前时间作为文件名
		   String folder=date.format(todaytime);//生成当前日期作为文件夹名
		  
		   File file=new File(path.toString());
		   
		   File[] files = file.listFiles();//得到根目录下的所有文件名目录
		  
		   for(int i=0;i < files.length;i++){
		   
		    if(files[i].isDirectory()){//判断是否为目录
		    
		     if(files[i].getName().equals(folder)){
		     
		      str=files[i].getName();
		    
		     }
		    } 
		   }
		  
		   if(str==null){
		     file1=new File(path.append("\\"+folder+"\\").toString());
		     file1.mkdir();//如果str等于空.则在根目录下创建folder目录.
		    // System.out.println("1:"+path);
		   }else{
		    path.append("\\"+str+"\\");//如果str不为空,则用原目录
		    //System.out.println("2:"+path);
		   }
       /*try {
			content=new String(content.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}*/

		   
		   /*		
		    * 文章封面处理
		   */	 
		   //start
	        //cover不是真实文件，只是保存在服务器上临时文件夹的文件
       try{
	        InputStream is = new FileInputStream(cover);
	        String covername=folder+".jpg";
	        OutputStream os = new FileOutputStream(new File(path.toString(), covername));
	     //   System.out.println("fileFileName: " + folder);
  	// 因为file是存放在临时文件夹的文件，我们可以将其文件名和文件路径打印出来，看和之前的fileFileName是否相同
	      //  System.out.println("cover: " +covername);
	      //  System.out.println("cover: " + file.getPath());
	        byte[] buffer = new byte[500];
	        int length = 0;
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        is.close();
	        os.close();
			article.setCoverpath(folder+"\\"+covername);
       }catch(Exception e){
		    e.printStackTrace();
       }
		   //end
	        
		   File file2 = new File(path.append(name+".html").toString());
		// System.out.println(path);
		   StringBuilder sb = new StringBuilder();
		   try {
		    file2.createNewFile();//创建文件
		    sb.append(content);
		    PrintStream printStream = new PrintStream(new FileOutputStream(file2));
		   
		    printStream.println(sb.toString());//将字符串写入文件
		    printStream.close();
		   //System.out.println(newPath);
/*		
 * 文章数据库处理
*/
		   path.delete(0, 11);
		   String newPath=path.toString().replace("\\", "/");
		   article.setPath(newPath);
		   articledao.add(article);
		   } catch (IOException e) {
		    e.printStackTrace();
		   }

	}

	@Override
	public List<Article> list(int curPage) {
		// TODO Auto-generated method stub
		List<Article> list=articledao.list(curPage);
		return list;
		}
	@Override
	public List<Article> listnew() {
		List<Article> list=articledao.listnew();
		return list;
	}

	@Override
	public List<Article> listcount() {
		List<Article> list=articledao.listcount();
		return list;
	}
	
	@Override
	public long listSize() {
		// TODO Auto-generated method stub
		long size=articledao.listSize();
		return size;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String path=articledao.delete(id);
		File file=new File("D:\\FileDemo"+path);
		if(file.exists())
			file.delete();
	}

	@Override
	public Article getArticle(int id) {
		// TODO Auto-generated method stub
		Article article=articledao.loadById(id);
		return article;
	}

	@Override
	public String getContent(String path) {
		// TODO Auto-generated method stub
		File file=new File("D:\\FileDemo"+path);
		StringBuilder result = new StringBuilder();
        try{
            BufferedReader br = new BufferedReader(new FileReader(file));//构造一个BufferedReader类来读取文件
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
                result.append(System.lineSeparator()+s);
            }
            br.close();    
        }catch(Exception e){
            e.printStackTrace();
        }
		return result.toString();
	}

	@Override
	public void update(String content, Article article) {
		File file=new File("D:\\FileDemo"+article.path);
		try {
			content=new String(content.getBytes("ISO-8859-1"),"UTF-8");
			String title=new String(article.getTitle().getBytes("ISO-8859-1"),"UTF-8");
			article.setTitle(title);
			String type=new String(article.getType().getBytes("ISO-8859-1"),"UTF-8");
			article.setType(type);
			String keyword=new String(article.getKeyword().getBytes("ISO-8859-1"),"UTF-8");
			article.setKeyword(keyword);;
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		   StringBuilder sb = new StringBuilder();
		   try {
			    sb.append(content);
			    PrintStream printStream = new PrintStream(new FileOutputStream(file));
			    printStream.println(sb.toString());//将字符串写入文件
			   //System.out.println(newPath);
			    printStream.close();
			    articledao.update(article);
			   } catch (IOException e) {
			    e.printStackTrace();
			   }
	}

	@Override
	public void updateCount(int id) {
		articledao.updateCount(id);
	}

}
