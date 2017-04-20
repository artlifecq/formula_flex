package com.rpgGame.app.ui.main.Task
{
	import com.game.engine3D.display.EffectObject3D;
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.EffectUrl;
	
	import org.mokylin.skin.mainui.renwu.RenWuZhuiZong_Skin;

	public class TaskEffectView
	{
		private var _skin:RenWuZhuiZong_Skin;
		private var effectSk:Inter3DContainer;
		private var finishEffect:EffectObject3D;
		private var newtaskEffect:EffectObject3D;
		private var isfinish:Boolean=false;//是否正在播放完成特效
		private var isNew:Boolean=false;//是否有新任务特效了
		public function TaskEffectView(skin:RenWuZhuiZong_Skin)
		{
			_skin=skin;
			
			init();
		}
		private function init():void
		{
			effectSk=new Inter3DContainer();
			effectSk.x =-150;
			effectSk.y = 20;
			_skin.task_effect.addChild(effectSk);
			finishEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_WANCHENGRENWU),0,0,1,onPlayComple);
			newtaskEffect=effectSk.addInter3D(ClientConfig.getEffect(EffectUrl.UI_XINRENWU));
			
		}
		
		
		public function playFinishEffect():void
		{
			finishEffect.playEffect(1,0.25);
			isfinish=true;
		}
		private function onPlayComple(self:InterObject3D):void
		{

			isfinish=false;
			if(isNew)
			{
				playNewtaskEffect();
			}
			
		}
		public function playNewtaskEffect():void
		{
			if(!isfinish)
			{
				newtaskEffect.playEffect(1,0.25);
				isNew=false;
			}
			else
			{
				isNew=true;
			}
		}
	}
}