package com.rpgGame.appModule.hunyin
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.HunYinManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.hunyin.JieHunJieZiData;
	import com.rpgGame.coreData.clientConfig.Q_advance_wedding;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	
	import org.mokylin.skin.app.hunyin.HunYin_Skin;
	
	/**
	 * 婚姻界面右边面板显示
	 * */
	public class HunYinRightPanel
	{
		private var _skin:HunYin_Skin;
		
		private var _changeList:Array;
		
		private const MAX_SHOW_NUM:int=5;
		private var _hunyinItems:Vector.<HunYinItem>;
		
//		private var _progressBar:AwdProgressBar;
		
		public function HunYinRightPanel(skin:HunYin_Skin)
		{
			_skin=skin;
			super();
			initView();
		}
		
		private function initView():void
		{
			_hunyinItems=new Vector.<HunYinItem>();
//			_progressBar=new AwdProgressBar(_skin.barJindu,"ui_zuomotiao");
//			_skin.grpBar.addChild(_progressBar);
//			_skin.grpBar.addChild(_skin.lbJindu);
			
			for(var i:int=0;i<MAX_SHOW_NUM;i++)
			{
				var panel:HunYinItem=new HunYinItem();
				panel.x=0;
				panel.y=i*panel.height;
				_hunyinItems.push(panel);
				_skin.skin_container.addChild(panel);
				panel.visible=false;
			}
		}
		
		public function show():void
		{
			showPower(false);
			updateAttribute();
			updateBestWishesValue();
		}
		
		//显示战斗力
		public function showPower(bool:Boolean=false):void
		{
			if(bool)
			{
				var nowFight:int=Mgr.hunyinMgr.Power;
				var change:int=nowFight-_skin.NumZhanli.number;
				_changeList=getChangeList(change);		
				var  timeLine : TimelineLite = new TimelineLite();
				for(var i:int=0;i<_changeList.length;i++){
					timeLine.append(TweenLite.delayedCall(0.1,delayTween,[_changeList[i]]));
				}
			}
			else
			{
				_skin.NumZhanli.number=Mgr.hunyinMgr.Power;
			}
		}
		
		private function delayTween(v:int):void
		{
			_skin.NumZhanli.number=v;
		}
		
		private function getChangeList(changeV:int):Array
		{
			var v:int=	Math.abs(changeV);
			var per:int;
			var i:int=5;
			while(i>0){
				per=Math.floor(v/i);
				if(per!=0){
					break;
				}
				i--;
			}
			if(changeV<0){
				per*=-1;
			}
			
			var num:int=i+1;
			var list:Array=[];
			for(i=1;i<num;i++){
				list.push(_skin.NumZhanli.number+i*per);
			}
			return list;
		}
		
		//更新属性加成
		public function updateAttribute():void
		{
			var has:HashMap=new HashMap();
			var info:Q_advance_wedding=JieHunJieZiData.getModByLv(Mgr.hunyinMgr.JieZiLv);
			var keys:Array;
			var values:Array;
			if(info)
			{
				var attValues:Q_att_values= AttValueConfig.getAttInfoById(HunYinManager.ins.getAttId(info));
				has=AttValueConfig.getTypeValueMap(attValues);
				keys=has.keys();
				values=has.values();
			}
			else  return;
			
			var nextHas:HashMap=new HashMap();
			var nextinfo:Q_advance_wedding=JieHunJieZiData.getModByLv(Mgr.hunyinMgr.JieZiLv+1);
			if(nextinfo)
			{
				attValues= AttValueConfig.getAttInfoById(HunYinManager.ins.getAttId(nextinfo));
				nextHas=AttValueConfig.getTypeValueMap(attValues);
			}
			for(var i:int=0;i<_hunyinItems.length;i++)
			{
				if(i<keys.length)
				{
					if(nextinfo)
						_hunyinItems[i].setData(keys[i],values[i],nextHas.getValue(keys[i]));
					else 
						_hunyinItems[i].setData(keys[i],values[i],0);
					_hunyinItems[i].visible=true;
				}
				else
					_hunyinItems[i].visible=false;
			}
			
		}
		
		//更新祝福值
		public function updateBestWishesValue():void
		{
			var num:int=Mgr.hunyinMgr.marriageInfos.intimacyValue;
			var needNum:int=JieHunJieZiData.getModByLv(Mgr.hunyinMgr.JieZiLv).q_max_intimacy;
			_skin.lbJindu.text=num.toString()+"/"+needNum.toString();
			if(num>=needNum) _skin.lbJindu.color=StaticValue.A_UI_GREEN_TEXT;
			else _skin.lbJindu.color=StaticValue.A_UI_RED_TEXT;
			_skin.barJindu.maximum=needNum;
			_skin.barJindu.value=num;
		}
	}
}