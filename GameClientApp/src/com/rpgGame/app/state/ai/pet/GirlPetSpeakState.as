package com.rpgGame.app.state.ai.pet
{
	import com.rpgGame.app.graphics.BubbleDialogFace;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.cfg.PetCfg;
	import com.rpgGame.coreData.clientConfig.Q_girl_pet;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	
	import flash.utils.getTimer;
	
	public class GirlPetSpeakState extends AIState
	{
		private var _lastSpeakTime:Number;
		public function GirlPetSpeakState()
		{
			super(AIStateType.AI_GIRL_SPEAK);
			_lastSpeakTime=getTimer();
		}
		private function get pet():SceneRole
		{
			return _machine.owner as SceneRole;
		}
		override public function execute():void
		{
			super.execute();
			if (pet) 
			{
				var qPet:Q_girl_pet=PetCfg.getPet((pet.data as GirlPetData).modId);
				var words:Array=(pet.data as GirlPetData).speakWords;
				if (qPet&&words&&words.length>0) 
				{
					var now:int=getTimer();
					if ((now-_lastSpeakTime)>=qPet.q_talktimes) 
					{
						_lastSpeakTime=now;
						if (!pet.dialogFace) 
						{
							pet.dialogFace=BubbleDialogFace.create(pet);
							pet.dialogFace.show();
						}
						pet.dialogFace.addWordFrame(RenderUnitType.BODY, RenderUnitID.BODY,words[int(words.length*Math.random())],1500);
					}
				}
			}
			removeSelf();
		}
	}
}