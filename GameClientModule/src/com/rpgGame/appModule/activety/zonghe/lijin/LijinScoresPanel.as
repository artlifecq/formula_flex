package com.rpgGame.appModule.activety.zonghe.lijin
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJinPaiHang_Item;
	
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 天降礼金排行榜面板
	 * @author YT
	 * 
	 */	
	public class LijinScoresPanel extends SkinUIPanel
	{
		private var _skin:Active_LiJinPaiHang;
		private var tiemList:Vector.<SkinnableContainer>;
		private var scoreList:Vector.<Active_LiJinPaiHang_Item>
		public function LijinScoresPanel()
		{
			_skin = new Active_LiJinPaiHang();
			super(_skin);
			init();
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			setScoreList();
			
		}
		override public function hide():void
		{
			super.hide();
			
			
			
		}
		
		private function setScoreList():void
		{
			var i:int;
			for(i=0;i<10;i++)
			{
				_skin["list"+i].visible=true;
				scoreList[i].lbName.text="玩家名称"+i;
				scoreList[i].lbKill.text="帮会"+i;
				scoreList[i].lbNum.text=""+5*i+100;
				
			}
			var myrank:int=30;
			if(myrank>0)
			{
				_skin["list"+10].visible=true;
				_skin.tishi.visible=false;
				setScoreRank(scoreList[10],myrank);
				scoreList[10].lbName.text="我的名称";
				scoreList[10].lbKill.text="我的帮会";
				scoreList[10].lbNum.text=""+300;
			}
			else
			{
				_skin["list"+10].visible=false;
				_skin.tishi.visible=true;
			}
			
			
			
		}
		private var colorlist:Array=[13311254,1538737,14663251,10724259];
		private function setScoreRank(lable:Active_LiJinPaiHang_Item,rank:int):void
		{
			if(lable)
			{
				if(rank<=3)
				{
					lable.lbName.color=colorlist[rank-1];
					lable.lbKill.color=colorlist[rank-1];
					lable.lbNum.color=colorlist[rank-1];
					lable.grpNo.visible=true;
					lable.lbNo.visible=false;
					lable.numZhanli.label=rank.toString();
				}
				else
				{
					lable.lbName.color=colorlist[3];
					lable.lbKill.color=colorlist[3];
					lable.lbNum.color=colorlist[3];
					lable.grpNo.visible=false;
					lable.lbNo.visible=true;
					lable.lbNo.text=rank.toString();
				}
			}
			
		}
		
		private function init():void
		{
			var i:int;
			scoreList=new Vector.<Active_LiJinPaiHang_Item>();
			for(i=0;i<11;i++)
			{
				scoreList.push(_skin["list"+i].skin as Active_LiJinPaiHang_Item);
			}
			
			for(i=0;i<scoreList.length;i++)
			{
				if(i%2==0||i==scoreList.length-1)
				{
					scoreList[i].bg1.visible=false;
					scoreList[i].bg2.visible=true;
				}
				else
				{
					scoreList[i].bg1.visible=true;
					scoreList[i].bg2.visible=false;
				}
				setScoreRank(scoreList[i],i+1);
				scoreList[i].lbName.text="";
				scoreList[i].lbKill.text="";
				scoreList[i].lbNum.text="";
				_skin["list"+i].visible=false;
			}
			
		}
		
		
		
		
		
		
	}
}