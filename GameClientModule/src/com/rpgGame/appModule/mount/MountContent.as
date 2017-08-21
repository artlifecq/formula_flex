package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.mount.HorseManager;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	
	import org.mokylin.skin.app.zuoqi.ZuoqiCont_Skin;
	
	public class MountContent 
	{
		private var _isShowNext:Boolean;
		private var _curShowHorse:int = 0;
		private var _skin:ZuoqiCont_Skin;
		private var _curtentInter3D:UIAvatar3D;
		private var _nextInter3D:UIAvatar3D;
		
		private var showP:Point=new Point(142,96);
		private var currentMisP:Point=new Point(-50,80);
		private var nextMisP:Point=new Point(340,80);
		
		public function MountContent(skin:ZuoqiCont_Skin):void
		{
			_skin = skin;
			super();
			
			_curtentInter3D=new UIAvatar3D(_skin.currentAvatar,1.8);
			_curtentInter3D.setRotationY(60);
			_nextInter3D=new UIAvatar3D(_skin.nextAvatar,1.8);
			_nextInter3D.setRotationY(60);
		}
		
		public function buttonLeft():void
		{
			refreshMode(_curShowHorse-1);
		}
		
		public function buttonRight():void
		{
			refreshMode(_curShowHorse+1);
		}
		
		public function refreshMode(level:int):void
		{
			if(_curShowHorse==level)
				return ;
			_curShowHorse = level;
			var housedata:Q_horse = HorseConfigData.getMountDataById(_curShowHorse)
			var nextShet:Q_horse = HorseConfigData.getMountDataById(_curShowHorse+1);
			this.addMode(housedata,nextShet);
			_skin.btn_prev.visible = _curShowHorse>1;
			_skin.btn_next.visible = _curShowHorse<Math.min(HorseConfigData.maxCount,HorseManager.instance().houseLevel);
			_skin.mc_name.gotoAndStop(_curShowHorse-1);
			_skin.mc_jieshu.gotoAndStop(_curShowHorse-1);
			
		}
		
		public function addMode(current:Q_horse,next:Q_horse):void
		{
			_curtentInter3D.updateBodyWithRes(current.q_skinResID,current.q_animatResID);
			if(next ==null)
				return ;
			_nextInter3D.updateBodyWithRes(next.q_skinResID,next.q_animatResID);
			_nextInter3D.scaleRole=0;
			_skin.nextAvatar.x=nextMisP.x;
			_skin.nextAvatar.y=nextMisP.y;
			onTween();
		}
		
		public function playTarget(bool:Boolean):void
		{
			if(_isShowNext==bool)
				return ;
			_isShowNext = bool;
			if(_nextInter3D==null)
				return ;
			_skin.currentAvatar.visible=true;
			_skin.nextAvatar.visible=true;
			TweenLite.killTweensOf(_nextInter3D,true);
			TweenLite.killTweensOf(_curtentInter3D,true);
			TweenLite.killTweensOf(_skin.currentAvatar,true);
			TweenLite.killTweensOf(_skin.nextAvatar,true);
			if(_isShowNext){
				TweenLite.to(_nextInter3D,1,{scaleRole:1.8});
				TweenLite.to(_curtentInter3D,1,{scaleRole:0});
				TweenLite.to(_skin.currentAvatar,1,{x:currentMisP.x,y:currentMisP.y,onComplete:onTween});
				TweenLite.to(_skin.nextAvatar,1,{x:showP.x,y:showP.y,onComplete:onTween});
			}else{
				TweenLite.to(_curtentInter3D,1,{scaleRole:1.8});
				TweenLite.to(_nextInter3D,1,{scaleRole:0});
				TweenLite.to(_skin.currentAvatar,1,{x:showP.x,y:showP.y,onComplete:onTween});
				TweenLite.to(_skin.nextAvatar,1,{x:nextMisP.x,y:nextMisP.y,onComplete:onTween});
			}
		}
		
		private function onTween():void
		{
			if(_isShowNext){
				_skin.currentAvatar.visible=false;
			}else{
				_skin.nextAvatar.visible=false;
			}
		}
	}
}
