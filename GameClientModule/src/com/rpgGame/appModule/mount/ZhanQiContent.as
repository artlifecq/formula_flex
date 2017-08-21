package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.mount.ZhanQiManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.ZhanQiConfigData;
	import com.rpgGame.coreData.clientConfig.Q_warflag;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.zuoqi.Zhanqi_Skin;
	
	public class ZhanQiContent
	{
		private var _skin:Zhanqi_Skin;
		
		private var _isShowNext:Boolean;
		private var _curShowZhanQi:int = 0;
		
		private var _curtentInter3D:UIAvatar3D;
		private var _nextInter3D:UIAvatar3D;
		
		private var showP:Point=new Point(142,96);
		private var currentMisP:Point=new Point(-50,80);
		private var nextMisP:Point=new Point(340,80);
		private var roleScale:Number=3;
		
		public function ZhanQiContent(skin:Zhanqi_Skin)
		{
			_skin=skin;
			super();
			_curtentInter3D=new UIAvatar3D(_skin.currentAvatar,roleScale);
			_nextInter3D=new UIAvatar3D(_skin.nextAvatar,roleScale);
		}
		
		public function buttonLeft():void
		{
			refeashMode(_curShowZhanQi-1);
		}
		
		public function buttonRight():void
		{
			refeashMode(_curShowZhanQi+1);
		}
		
		public function refeashMode(level:int):void
		{
			if(_curShowZhanQi==level)
				return ;
			_curShowZhanQi = level;
			var nowdata:Q_warflag=ZhanQiConfigData.getZhanQiDataById(_curShowZhanQi);
			var nextdata:Q_warflag=ZhanQiConfigData.getZhanQiDataById(_curShowZhanQi+1);
			this.addMode(nowdata,nextdata);
			_skin.btn_prev.visible = _curShowZhanQi>1;
			_skin.btn_next.visible = _curShowZhanQi<Math.min(ZhanQiConfigData.maxCount,ZhanQiManager.instance().zhanqiLevel);
			_skin.mc_name.gotoAndStop(_curShowZhanQi-1);
			_skin.mc_jieshu.gotoAndStop(_curShowZhanQi-1);
		}
		
		public function addMode(current:Q_warflag,next:Q_warflag):void
		{
			_curtentInter3D.updateBodyWithRes(ClientConfig.getZhanqi(current.q_panel_show_id));
			if(next ==null)
				return ;
			_nextInter3D.updateBodyWithRes(ClientConfig.getZhanqi(next.q_panel_show_id));
			_nextInter3D.scaleRole=0;
			
		}
		
		
		public function playTarget(bool:Boolean):void
		{
			if(_isShowNext==bool)
				return ;
			_isShowNext = bool;
			if(_nextInter3D==null)
				return ;
			TweenLite.killTweensOf(_nextInter3D,true);
			TweenLite.killTweensOf(_curtentInter3D,true);
			TweenLite.killTweensOf(_skin.currentAvatar,true);
			TweenLite.killTweensOf(_skin.nextAvatar,true);
			if(_isShowNext){
				TweenLite.to(_nextInter3D,1,{scaleRole:roleScale});
				TweenLite.to(_curtentInter3D,1,{scaleRole:0});
				TweenLite.to(_skin.currentAvatar,1,{x:currentMisP.x,y:currentMisP.y,onComplete:onTween});
				TweenLite.to(_skin.nextAvatar,1,{x:showP.x,y:showP.y,onComplete:onTween});
			}else{
				TweenLite.to(_curtentInter3D,1,{scaleRole:roleScale});
				TweenLite.to(_nextInter3D,1,{scaleRole:0});
				TweenLite.to(_skin.currentAvatar,1,{x:showP.x,y:showP.y,onComplete:onTween});
				TweenLite.to(_skin.nextAvatar,1,{x:nextMisP.x,y:nextMisP.y,onComplete:onTween});
			}
		}
		
		private function onTween():void
		{
			if(_isShowNext){
				_curtentInter3D.touchable=false;
				_nextInter3D.touchable=true;
			}else{
				_curtentInter3D.touchable=true;
				_nextInter3D.touchable=false;
			}
		}
	}
}