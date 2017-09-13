package  com.rpgGame.app.graphics.title
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_title_control;
	import com.rpgGame.coreData.type.SceneCharType;
	
	public class RoleEffectTitle extends Inter3DContainer implements IBaseTitle
	{
		private var _tw:int;
		private var _th:int;
		
		private var _data:Q_title_control;
		public function RoleEffectTitle()
		{
			super();
			
		}
		public function get data():Q_title_control
		{
			return _data;
		}
	

		public function playEffect(roleType:String,data:Q_title_control,repeat : int =0, onPlayComplete : Function = null,addComplete:Function=null) : *
		{
			_data=data;
			var toScale:Number=1;
			if (SceneCharType.SCULPTURE==roleType) 
			{
				toScale=_data.q_modle_scale/100;
			}
			else
			{
				toScale=(_data.q_hero_scale/100);
			}
			this._th=_data.q_effects_high*toScale;
			
			var obj:InterObject3D = playInter3DAt(ClientConfig.getEffect(_data.q_effects),0,_th/2,repeat,onPlayComplete,addComplete);
			obj.baseObj3D.setScale(toScale);
			return obj;
		}
		override public function get width():Number
		{
			return 0;
		}
		override public function get height():Number
		{
			return _th;
		}
	}
}