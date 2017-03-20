package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.coreData.role.RoleData;
	
	import org.mokylin.skin.mainui.head.Head_small;
	
	/**
	 *小怪 
	 * @author dik
	 * 
	 */
	public class MonsterNormalBar extends MonsterHeadBase
	{
		private var _skin:Head_small;
	
		public function MonsterNormalBar()
		{
			_skin=new Head_small();
			super(_skin);
		}
		
		override protected function changeHp(data:RoleData):void
		{
			if(data.id!=_monsterData.id){
				return;
			}
			super.changeHp(data);
			
		}
	}
}