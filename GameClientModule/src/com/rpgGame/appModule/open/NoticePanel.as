package com.rpgGame.appModule.open
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.geom.Rectangle;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class NoticePanel extends SkinUIPanel
	{
		private static var sHelperRect:Rectangle = new Rectangle();
		private var _qdata:Q_newfunc;
		private var _content:NoticeOpenState;
		private var _isOpen:Boolean;
		private var _isRun:Boolean = false;
		public function NoticePanel():void
		{
			super(null);
			this.escExcuteAble = false;
			initView();
		}
		private function initView():void
		{
			_content = new NoticeOpenState();
			this.addChild(_content);
			_isOpen = true;
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			if(this.parent == null)
				super.show(data,openTable,parentContiner);
			_qdata = data as Q_newfunc;
			refeashView();
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void
		{
			if(_isRun)
				return ;
			if(_isOpen)
			{
				_isRun = true;
				_content.alpha = 0;
				_isOpen = false;
				this.playInter3DAt(ClientConfig.getEffect("ui_xingongnengkaiqi_1"),_content.width/2,_content.height/2,1,overEffectCompleteHandler);
			}else{
				_content.alpha = 1;
				_isOpen = true;
				if(_sr3c!=null)
				{
					this.removeChild3D(_sr3c,true);
				}
			}
		}
		private var _sr3c:InterObject3D;
		private function overEffectCompleteHandler(sr3D : InterObject3D):void
		{
			_sr3c = new InterObject3D();
			var data : RenderParamData3D = new RenderParamData3D(0, "effect_ui", ClientConfig.getEffect("ui_xingongnengkaiqi_2"));
			data.forceLoad=true;//ui上的3d特效强制加载
			_sr3c.touchable = true;
			var res:RenderUnit3D = _sr3c.addRenderUnitWith(data, 0);
			res.setScale(0.3);
			_sr3c.x = _content.width/2;
			_sr3c.y = _content.height/2;
			
			addChild3D(_sr3c);
			_isRun = false;
		}
		
		
		private function refeashView():void
		{
			_content.refeashView(_qdata);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = 400;
			this.y = sh - 300;
		}
	}
}