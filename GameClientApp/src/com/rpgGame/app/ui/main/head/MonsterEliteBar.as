package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.coreData.role.RoleData;
	
	import org.mokylin.skin.mainui.head.Head_middle;
	
	/**
	 *中级怪 
	 * @author dik
	 * 
	 */
	public class MonsterEliteBar extends MonsterHeadBase
	{
		private var _skin:Head_middle;
		
		public function MonsterEliteBar()
		{
			_skin=new Head_middle();
			super(_skin);
		}
		
		override protected function changeHp(data:RoleData):void
		{
			if(data.id!=_monsterData.id){
				return;
			}
			super.changeHp(data);
			var scaleX:Number=data.totalStat.hp/data.totalStat.life;
			scaleX=scaleX>1?1:scaleX;
			_skin.xuetiao_hong.scaleX=scaleX;
		}
	}
}