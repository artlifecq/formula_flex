package com.rpgGame.appModule.open
{
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.vo.RenderParamData3D;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.appModule.systemset.TouchToState;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.cfg.NewFuncCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import flash.geom.Point;
	
	import feathers.controls.ButtonState;
	import feathers.controls.UIAsset;
	
	import gs.easing.Bounce;
	
	import org.mokylin.skin.app.xingongneng.KaiQi_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.Pool;
	
	public class OpenPanel extends SkinUIPanel
	{
		private var _skin:KaiQi_Skin;
		private var _qdata:Q_newfunc;
		private var _button:IOpen;
		private var _needCreate:Boolean= true;
		private var _idlist:Vector.<Q_newfunc>;
		private var _effect:InterObject3D;
		private var _info:FunctionBarInfo;
		private var _touchstate:TouchToState;
		public function OpenPanel():void
		{
			_skin = new KaiQi_Skin();
			super(_skin);
			this.model = true;
			_idlist = new Vector.<Q_newfunc>();
		}
		protected var _touchPointID:int = -1;
		override protected function onTouch(e:TouchEvent):void
		{
			if(this._touchPointID >= 0)
			{
				//a touch has begun, so we'll ignore all other touches.
				var touch:Touch = e.getTouch(_skin.Icons, null, this._touchPointID);
				if(!touch)
				{
					return;
				}
				
				var stage:Stage = _skin.Icons.stage;
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
				touch = e.getTouch(_skin.Icons, TouchPhase.BEGAN);
				if(touch !== null )
				{
					this.changeState(ButtonState.DOWN);
					this._touchPointID = touch.id;
					return;
				}
				touch = e.getTouch(_skin.Icons, TouchPhase.HOVER);
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
				_skin.Icons.width = 145;
				_skin.Icons.height = 135;
				_skin.Icons.x = 49;
				_skin.Icons.y = 22;
			}else{
				_skin.Icons.width = 160;
				_skin.Icons.height = 149;
				_skin.Icons.x = 40;
				_skin.Icons.y = 16;
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
			this.visible = true;
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
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			_idlist.length = 0;
			var list:Vector.<String> = data as Vector.<String>;
			var length:int = list.length;
			var qfun:Q_newfunc;
			for(var i:int=0;i<length;i++)
			{
				qfun = NewFuncCfgData.getdataById(list[i]);
				if(qfun.q_show_panel == 1)
				{
					_idlist.push(qfun);
				}
			}
			if(_idlist.length == 0)
			{
				this.hide();
				return ;
			}
			super.show(data,openTable,parentContiner);
			refeashView();
		}
		
		
		private function refeashView():void
		{
			_qdata = _idlist.pop();
			if(_qdata==null)
			{
				this.hide();
				return ;
			}else{
				initView();
			}
			_needCreate = false;
			
			var ids:Array = JSONUtil.decode(_qdata.q_main_id) as Array;
			_info = FuncionBarCfgData.getActivityBarInfo(ids[0]);
			_button= MainButtonManager.getButtonBuyInfo(_info);
			if(_button==null)
				GameLog.add("配置错误提示:图标id="+_info.id+",功能:"+_info.name+"按钮未找到");
			_skin.Icons.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/145.png";
			_skin.uiName.styleName = "ui/app/xingongneng/icon/"+_qdata.q_openIcon+"/name.png";
			_skin.uiName.x = (this.width - _skin.uiName.width)/2;
			this.changeState(ButtonState.UP);
		}
		protected function runFly():void
		{
			this.visible = false;
			var startPos:Point = _skin.Icons.localToGlobal(new Point(0,0));
			var icon:UIAsset = new UIAsset();
			icon.x = startPos.x;
			icon.y = startPos.y;
			icon.styleName = _skin.Icons.styleName;
			var endpos:Point;
			if(!_button){//容错处理
				endpos = new Point();
				
			}else{
				endpos = _button.localToGlobal(new Point(_button.width/2,_button.height/2));
			}
			var timeobj:Object = {x:endpos.x - 5, y:endpos.y,scaleX:0.3,scaleY:0.3,ease:Bounce.easeOut};
			ItemActionManager.addTweenDisplay(endpos,icon,timeobj,onTweenFlyComplete);
			if(_idlist.length ==0)
			{
				this.hide();
				return ;
			}
		}
		private function onTweenFlyComplete():void
		{
			if(_button!=null)
				_button.runAnimation();
			refeashView();
		}
		
	}
}