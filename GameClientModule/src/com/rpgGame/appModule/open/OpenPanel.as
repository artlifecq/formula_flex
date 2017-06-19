package com.rpgGame.appModule.open
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	
	import gs.easing.Bounce;
	
	import org.mokylin.skin.app.xingongneng.KaiQi_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class OpenPanel extends SkinUIPanel
	{
		private var _skin:KaiQi_Skin;
		private var _qdata:Q_newfunc;
		private var _button:IOpen;
		private var _needCreate:Boolean= true;
		private var _idlist:Vector.<String>;
		private var _effect:InterObject3D;
		public function OpenPanel():void
		{
			_skin = new KaiQi_Skin();
			super(_skin);
			this.escExcuteAble = false;
//			initView();
		}
		
		private function initView():void
		{
			this.visible = true;
			_effect = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("tx_xingongnengkaiqi"));
			data.forceLoad=true;//ui上的3d特效强制加载
			_effect.addRenderUnitWith(data, 1,onPlayComplete);
			this.addChild3D(_effect,0);
			_effect.x = this.width/2;
			_effect.y = 95;
		}
		private function onPlayComplete(sr3D : InterObject3D):void
		{
			this.removeChild(sr3D);
			_effect = null;
			runFly();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_idlist = data as Vector.<String>;
			refeashView();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if(_effect!=null)
			{
				_effect.stop();
				_effect = null;
			}
			runFly();
		}
		private function refeashView():void
		{
			if(_idlist==null||_idlist.length<=0)
			{
				return ;
			}else{
				initView();
			}
			_needCreate = false;
			_qdata = NewFuncCfgData.getdataById(_idlist.pop());
			var info:FunctionBarInfo = FuncionBarCfgData.getActivityBarInfo(_qdata.q_main_id);
			_button= MainButtonManager.getButtonBuyInfo(info);
			_skin.Icons.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/145.png";
			_skin.uiName.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/name.png";
			_skin.uiName.x = (this.width - _skin.uiName.width)/2;
		}
		protected function runFly():void
		{
			if(!_button){//容错处理
				this.hide();
				return;
			}
			this.visible = false;
			var startPos:Point = _skin.Icons.localToGlobal(new Point(0,0));
			var icon:UIAsset = new UIAsset();
			icon.x = startPos.x;
			icon.y = startPos.y;
			icon.styleName = _skin.Icons.styleName;
			var endpos:Point = _button.localToGlobal(new Point(_button.width/2,_button.height/2));
			var timeobj:Object = {x:endpos.x - 5, y:endpos.y,scaleX:0.3,scaleY:0.3,ease:Bounce.easeOut};
			ItemActionManager.addTweenDisplay(endpos,icon,timeobj,onTweenFlyComplete);
		}
		private function onTweenFlyComplete():void
		{
			_needCreate = true;
			_button.runAnimation();
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