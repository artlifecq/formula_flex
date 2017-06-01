package com.rpgGame.appModule.open
{
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.buttons.MainButtonBases;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	
	import gs.easing.Sine;
	
	import org.mokylin.skin.app.xingongneng.KaiQi_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class OpenPanel extends SkinUIPanel
	{
		private var _skin:KaiQi_Skin;
		private var _qdata:Q_newfunc;
		private var _button:MainButtonBases;
		private var _needCreate:Boolean= true;
		private var _idlist:Vector.<int>;
		public function OpenPanel():void
		{
			_skin = new KaiQi_Skin();
			super(_skin);
			this.escExcuteAble = false;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			
			_idlist = data as Vector.<int>;
			
			refeashView();
		}
		
		private function refeashView():void
		{
			if(_idlist==null||_idlist.length<=0)
				return ;
			_needCreate = false;
			_qdata = NewFuncCfgData.getdataById(_idlist.pop());
			var info:FunctionBarInfo = FuncionBarCfgData.getActivityBarInfo(_qdata.q_main_id);
			_button= MainButtonBases.getButtonBuyInfo(info);
			_skin.Icons.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/145.png";
			_skin.uiName.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/name.png";
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			var startPos:Point = _skin.Icons.localToGlobal(new Point(0,0));
			var icon:UIAsset = new UIAsset();
			icon.x = startPos.x;
			icon.y = startPos.y;
			icon.styleName = _skin.Icons.styleName;
			var endpos:Point = _button.localToGlobal(new Point(0,0));
			var timeobj:Object = {x:endpos.x - 5, y:endpos.y,scaleX:0.1,scaleY:0.1,ease:Sine.easeInOut};
			ItemActionManager.addTweenDisplay(endpos,icon,timeobj,onTweenFlyComplete);
		}
		private function onTweenFlyComplete():void
		{
			_needCreate = true;
			if(_idlist.length<=0)
				this.hide();
			else
				refeashView();
		}
		
		override public function hide():void
		{
			_needCreate = true;
			super.hide();
		}
	}
}