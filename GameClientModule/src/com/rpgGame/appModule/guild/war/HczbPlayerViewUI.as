package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengZhengBa;
	
	/**
	 * 皇城争霸帮众信息
	 * @author dik
	 * 
	 */
	public class HczbPlayerViewUI extends ViewUI
	{
		private var _skin:WangChengZhengBa;
		
		private var headList:Vector.<WangChengHead_Item>;
		private var roleList:Vector.<UIAvatar3D>;
		
		public function HczbPlayerViewUI()
		{
			_skin=new WangChengZhengBa();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			headList=new Vector.<WangChengHead_Item>();
			roleList=new Vector.<UIAvatar3D>();
			for(var i:int=1;i<6;i++){
				headList.push(_skin["head"+i].skin);
				roleList.push(new UIAvatar3D(_skin["playerGrp"+i]));
			}
		}
	}
}