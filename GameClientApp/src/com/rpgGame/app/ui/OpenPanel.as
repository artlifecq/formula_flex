package com.rpgGame.app.ui
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.display2D.PopSkinUI;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.MainBtnCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.cfg.PanelCfgData;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	import com.rpgGame.coreData.clientConfig.Q_panel;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import flash.geom.Point;
	
	import feathers.controls.ButtonState;
	import feathers.controls.UIAsset;
	
	import gs.easing.Bounce;
	
	import org.mokylin.skin.app.xingongneng.KaiQi_Skin;
	
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.Pool;
	
	public class OpenPanel extends PopSkinUI
	{
		private var m_skin:KaiQi_Skin;
		private var _qdata:Q_newfunc;
		private var _button:IOpen;
		private var _needCreate:Boolean= true;
		private var _idlist:Vector.<Q_newfunc>;
		private var _effect:InterObject3D;
		private var _list:Vector.<int>;
		private static var _isLoading:Boolean=false;
		public function OpenPanel(list:Vector.<int>):void
		{
			_skin = new KaiQi_Skin();
			super(null);
			m_skin = _skin as KaiQi_Skin;
			_list = list;
			this.touchable=true;
			UIModel.instence.switchModel(this,true,2);
			if(!_isLoading)
			{
				var loadUrl : String = ClientConfig.getUI("xingongneng");
				AppLoadManager.instace().loadByUrl(loadUrl, "", onLoadComplete, onError);
			}
		}
		
		public function onLoadComplete(_appUrl : String = null) : void
		{
			_isLoading = true;
			onShow();
		}
		private function onError(url : String) : void
		{
			dispose();
			_isLoading = false;
			GameLog.add("应用模块加载出错" + url);
		}
		override protected function onShow():void
		{
			if(!_isLoading)
				return ;
			_idlist = new Vector.<Q_newfunc>();
			var length:int = _list.length;
			var qfun:Q_newfunc;
			for(var i:int=0;i<length;i++)
			{
				qfun = NewFuncCfgData.getFuncCfg(_list[i]);
				if(qfun.q_id==EmFunctionID.EM_REDREWARD){
					RedRewardManager.instance().funcOpening=true;
				}
					
				_idlist.push(qfun);
			}
			if(_idlist.length == 0)
			{
				this.popComplete();
			}else{
				refeashView();
			}			
		}
		protected var _touchPointID:int = -1;
		override protected function onTouch(e:TouchEvent):void
		{
			if(this._touchPointID >= 0)
			{
				//a touch has begun, so we'll ignore all other touches.
				var touch:Touch = e.getTouch(this, null, this._touchPointID);
				if(!touch)
				{
					return;
				}
				
				var stage:Stage = m_skin.Icons.stage;
				if(stage !== null)
				{
					var point:Point = Pool.getPoint();
					touch.getLocation(stage, point);
					var isInBounds:Boolean = this.contains(stage.hitTest(point));
					Pool.putPoint(point);
					if(touch.phase === TouchPhase.MOVED)
					{
						
						if(isInBounds)
						{
							this.changeState(ButtonState.DOWN);
							return;
						}
						else
						{
							this.changeState(ButtonState.UP);
							return;
						}
					}
					else if(touch.phase === TouchPhase.ENDED)
					{
						this._touchPointID = -1;
						this.changeState(ButtonState.UP);
						return;
					}
				}
			}
			else
			{
				//we aren't tracking another touch, so let's look for a new one.
				touch = e.getTouch(this, TouchPhase.BEGAN);
				if(touch !== null )
				{
					this.changeState(ButtonState.DOWN);
					this._touchPointID = touch.id;
					return;
				}
				touch = e.getTouch(this, TouchPhase.HOVER);
				if(touch !== null)
				{
					this.changeState(ButtonState.HOVER);
					return;
				}
				
				//end of hover
				this.changeState(ButtonState.UP);
			}
		}
		private function changeState(value:String):void
		{
			if(value == ButtonState.UP)
			{
				m_skin.Icons.width = 145;
				m_skin.Icons.height = 135;
				m_skin.Icons.x = 49;
				m_skin.Icons.y = 22;
			}else{
				m_skin.Icons.width = 160;
				m_skin.Icons.height = 149;
				m_skin.Icons.x = 40;
				m_skin.Icons.y = 16;
			}
			
			if(value == ButtonState.DOWN)
			{
				if(_effect!=null)
				{
					_effect.stop();
					this.removeChild3D(_effect);
					_effect = null;
				}
				runFly();
			}
		}
		
		private function initView():void
		{
			setViesible(true);
			if(_effect!=null)
			{
				this.removeChild3D(_effect);
				_effect = null;
			}
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
			this.removeChild3D(_effect);
			_effect = null;
			runFly();
		}
	
		private function refeashView():void
		{
			if(this.parent==null)
				return ;
			_qdata = _idlist.pop();
			if(_qdata==null)
			{
				this.popComplete();
				return ;
			}else{
				initView();
			}
			_needCreate = false;
			_button= MainButtonManager.getButtonByInfo(MainBtnCfgData.getMainBtnCfg(_qdata.q_open_btn));
			if(_button==null)
				GameLog.add("配置错误提示:图标id="+_qdata.q_id+",功能:"+_qdata.q_name+"按钮未找到");
			m_skin.Icons.styleName = "ui/icon/xingongneng/"+_qdata.q_res_dir+"/145.png";
			m_skin.uiName.styleName = "ui/icon/xingongneng/"+_qdata.q_res_dir+"/name.png";
			m_skin.uiName.x = (this.width - m_skin.uiName.width)/2;
			if(this._touchPointID<0)
				this.changeState(ButtonState.UP);
			else
				this.changeState(ButtonState.HOVER);
		}
		protected function runFly():void
		{
			setViesible(false);
//			var startPos:Point = this.localToGlobal(new Point(0,0));
			var icon:UIAsset = new UIAsset();
			icon.x = this.x +m_skin.Icons.x;
			icon.y = this.y +m_skin.Icons.y;
			icon.styleName = m_skin.Icons.styleName;
			var endpos:Point;
			if(!_button){//容错处理
				endpos = new Point();
			}else{
				endpos = _button.localToGlobal(new Point(_button.width/2,_button.height/2));
			}
			var timeobj:Object = {x:endpos.x - 5, y:endpos.y,scaleX:0.3,scaleY:0.3,ease:Bounce.easeOut};
			ItemActionManager.addTweenDisplay(endpos,icon,timeobj,onTweenFlyComplete);
			
		}
		
		private function setViesible(value:Boolean):void
		{
			m_skin.Icons.visible = value;
			m_skin.uiName.visible = value;
		}
		private function onTweenFlyComplete():void
		{
			if(_button!=null)
				_button.runAnimation();
			if(_qdata&&_qdata.q_show_panel){//开启完成后打开面板
				FunctionOpenManager.openPanelByFuncInfo(_qdata);
				if(_qdata.q_id==EmFunctionID.EM_REDREWARD){
					RedRewardManager.instance().funcOpening=false;
				}
			}
			refeashView();
		}
		override protected function popComplete():void
		{
			super.popComplete();
			UIModel.instence.switchModel(this,false,1);
		}
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x = (sw - this.width) / 2;
			this.y = (sh - this.height) / 2;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height
		}
	}
}