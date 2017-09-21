package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.coreData.role.RoleData;
	
	import org.mokylin.skin.mainui.head.Head_boss;
	
	import starling.display.DisplayObject;
	
	/**
	 *boss 
	 * @author dik
	 * 
	 */
	public class MonsterBossBar extends MonsterHeadBase
	{
		private var _skin:Head_boss;
		
		/**
		 *血量管数 
		 */
		private var maxBloodNum:int;
		private var _showBloodIndex:int;
		private var _bloodBar:DisplayObject;
		private var _bloodBarBg:DisplayObject;
		private var _bloodBars:Vector.<DisplayObject>;
		private var curBloodNum:int;
		private var firstBlood:int;
		private var maxBloodIndex:int;
		private var bloodBarNum:int;
		
		public function MonsterBossBar()
		{
			_skin=new Head_boss();
			_bloodBars=new Vector.<DisplayObject>();
			for(var i:int=0;i<_skin.grp_xueyiao.numChildren;i++){
				_bloodBars.push(_skin.grp_xueyiao.getChildAt(i));
			}
			super(_skin);
		}
		
		
		private function set showBloodIndex(value:int):void
		{
			if(_bloodBar){
				_bloodBar.visible=false;
			}
			if(_bloodBarBg){
				_bloodBarBg.visible=false;
			}
			_showBloodIndex = value;
			_bloodBar=_bloodBars[_showBloodIndex];
			if(curBloodNum!=1){//不是最后一管血就显示背景血条
				if(_showBloodIndex!=0){
					_bloodBarBg=_bloodBars[_showBloodIndex-1];
				}else{
					_bloodBarBg=_bloodBars[_bloodBars.length-1];
				}
				_skin.grp_xueyiao.addChild(_bloodBarBg);
				_bloodBarBg.scaleX=1;
				_bloodBarBg.visible=true;
			}else{
				_bloodBarBg=null;
			}
			_bloodBar.scaleX=1;
			_bloodBar.visible=true;
			_skin.grp_xueyiao.addChild(_bloodBar);
		}

		override public function refresh():void
		{
			for(var i:int=0;i<_skin.grp_xueyiao.numChildren;i++){
				_skin.grp_xueyiao.getChildAt(i).visible=false;
			}
			super.refresh();
			maxBloodNum=Math.ceil(_monsterData.totalStat.life/_monsterCfg.q_per_blood);
			bloodBarNum=_skin.grp_xueyiao.numChildren
			if(maxBloodNum>=bloodBarNum){
				maxBloodIndex=bloodBarNum-1;
			}else{
				maxBloodIndex=maxBloodNum;
			}
			
			if(_monsterData.totalStat.life%_monsterCfg.q_per_blood==0){
				firstBlood=_monsterCfg.q_per_blood;
			}else{
				firstBlood=_monsterData.totalStat.life%_monsterCfg.q_per_blood;
			}
			
//			_skin.lbl_name.text=_monsterCfg.q_name;
			changeHp(_monsterData);
		}
		
		override protected function updateAttInfo():void
		{
			
		}
		
		override protected function changeHp(data:RoleData):void
		{
			if(data.id!=_monsterData.id){
				return;
			}
			super.changeHp(data);
			var allSubHp:int=data.totalStat.life-data.totalStat.hp;
			curBloodNum=Math.ceil(data.totalStat.hp/_monsterCfg.q_per_blood);
//			curBloodNum=2;
			var leftNum:int=curBloodNum-1;
			leftNum=leftNum<0?0:leftNum;
			showBloodIndex=leftNum%bloodBarNum;
//			showBloodIndex=1;
//			_skin.lbl_num.text=data.totalStat.hp+"/"+data.totalStat.life;
			_skin.uim_xuetiao.label="x"+leftNum;
			_skin.uim_xuetiao.visible=leftNum==0?false:true;
			var leftHp:int;
			var maxBlood:int=_monsterCfg.q_per_blood;
			if(curBloodNum==maxBloodNum){
				maxBlood=firstBlood;
				leftHp=maxBlood-allSubHp;
			}else{
				allSubHp-=firstBlood;
				leftHp=maxBlood-allSubHp%maxBlood;
			}
			leftHp=data.totalStat.hp==0?0:leftHp;
			var scaleX:Number=leftHp/maxBlood;
			scaleX=scaleX>1?1:scaleX;
			if(scaleX==0){
				_bloodBar.visible=false;
				if(_bloodBarBg){
					_bloodBarBg.visible=false;
				}
			}else{
				_bloodBar.scaleX=scaleX;
			}
		}
	}
}