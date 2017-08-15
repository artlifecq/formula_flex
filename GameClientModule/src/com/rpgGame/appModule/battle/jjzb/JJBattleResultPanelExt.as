package com.rpgGame.appModule.battle.jjzb
{
	import com.game.engine2D.config.staticdata.CharAngleType;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.zhengba.bean.AwardItemInfo;
	
	import app.message.GoodsType;
	
	import away3d.events.Event;
	
	import feathers.controls.UINumber;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.TiaoZhanJieSuan_Shengli;
	
	import starling.display.DisplayObjectContainer;
	
	public class JJBattleResultPanelExt extends SkinUIPanel
	{
		private var _skin:TiaoZhanJieSuan_Shengli;
		private var _hash:HashMap=new HashMap();
		private var _fightScene:JJBattleSceneView;
		public function JJBattleResultPanelExt()
		{
			_skin=new TiaoZhanJieSuan_Shengli();
			super(_skin);
			this.model=true;
			this.dragAble=false;
			
			this._skin.btnOk.addEventListener(Event.TRIGGERED,onClose);
			_hash.put(CharAttributeType.RES_EXP,_skin.numExp);
			_hash.put(CharAttributeType.RES_PRESTIGE,_skin.numShengwang);
			_hash.put(CharAttributeType.RES_BIND_MONEY,_skin.numYuanbao);
			_hash.put(CharAttributeType.RES_ZHENQI,_skin.numLingqi);
		}
		
		private function onClose(eve:Event):void
		{
			// TODO Auto Generated method stub
			hide();
			if (_fightScene) 
			{
				_fightScene.hide();
			}
			EventManager.dispatchEvent(JJBattleEvent.GOBACK);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var arr:Array=data;
			var isWin:Boolean=arr[0];
			_skin.uiTip.visible=!isWin;
			if (isWin) 
			{
				_skin.imgWin.styleName="ui/big_bg/activety/tianzhanshengli.png";
			}
			else
			{
				_skin.imgWin.styleName="ui/big_bg/activety/tiaozhanshibai.png";
			}
			_skin.numPaiming.label=arr[1]+"";
			_hash.eachValue(function(num:UINumber):void
			{
				num.label="0";
			});
			var awards:Vector.<AwardItemInfo>=arr[2];
			for (var i:int = 0; i < awards.length; i++) 
			{
				_hash.getValue(awards[i].type).label=awards[i].value;
			}
			_fightScene=arr[3];
		}
		
	}
}