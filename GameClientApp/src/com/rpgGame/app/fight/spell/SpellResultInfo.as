package com.rpgGame.app.fight.spell
{
	import com.game.engine3D.vo.BaseRole;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.info.fight.FightSingleHurt;
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.fight.message.SCAttackerResultMessage;
	
	import flash.geom.Point;

	/**
	 * 技能伤害结果info 
	 * @author NEIL
	 * 
	 */	
	public class SpellResultInfo
	{
		public var releaseSpellInfo:ReleaseSpellInfo;
		
		public var hurtList : Vector.<FightHurtResult>;
		public var isMainCharHited : Boolean = false; //主角是否被打了
		
		public var singleHurtVo:FightHurtResult;
		
		//		//施法结果列表，结果的类型分两种：1、状态改变效果，2、伤害效果
		public var stateList : Vector.<BuffData>;
		
		public function SpellResultInfo()
		{
		}
		
		public static function setSpellResultInfo(msg:ResAttackResultMessage):SpellResultInfo
		{
			var info : SpellResultInfo = new SpellResultInfo();
			createResults(info, msg);
			
			return info;
		}
		
		/**
		 * 技能造成的伤害和buff列表处理（通用）
		 * @param info
		 * @param buffer
		 *
		 */
		private static function createResults(info : SpellResultInfo, msg : ResAttackResultMessage) : void
		{
			//类型和血量
			var hurtList : Vector.<FightHurtResult> = new Vector.<FightHurtResult>;
			var hurtCharList : Vector.<SceneRole> = new Vector.<SceneRole>;
			var isHited : Boolean = false;
			var resultInfo:AttackResultInfo;
			var isState : Boolean = false;//现在还没有技能触发buff的功能，暂时不走这里面的逻辑
			
//			for(var i:uint = 0;i<msg.infos.length;i++)
//			{
				resultInfo = msg.state;
				
				var hurtResultVO : FightHurtResult = new FightHurtResult();
				
				hurtResultVO.readSpellEffectData(resultInfo.skillId);
				
				hurtResultVO.curLife = resultInfo.damage;
				
//				var hasPositionChange:Boolean = (resultInfo.newPos.x != 0 || resultInfo.newPos.y != 0);
				hurtResultVO.newPosition = new Point(resultInfo.newPos.x, resultInfo.newPos.y);
				
				trace(resultInfo.newPos.x + "\t" +  resultInfo.newPos.y);
				
				hurtResultVO.hasPositionChange = resultInfo.fightResult == 8;
				hurtResultVO.hasPositionFly = resultInfo.fightResult == 16;
				hurtResultVO.stiffTime = hurtResultVO.deadLaunchDistance/hurtResultVO.deadLaunchSpeed * 1000;
				
				hurtResultVO.targetID = resultInfo.targetId.ToGID();//目标
				hurtResultVO.targetRole = SceneManager.getSceneObjByID(hurtResultVO.targetID) as BaseRole;
				if(hurtResultVO.targetRole == null)
				{
					GameLog.addShow("被攻击者为空!攻击者服务器ID为：\t " + resultInfo.targetId.ToString());
				}
				
				if(hurtResultVO.targetRole && hurtResultVO.targetRole.usable)
				{
					hurtResultVO.targetPos = new Point(hurtResultVO.targetRole.x, hurtResultVO.targetRole.z);
				}
				
				///攻击者的信息
				hurtResultVO.atkorID = resultInfo.attackerId.ToGID();//攻击者
				hurtResultVO.atkor = SceneManager.getSceneObjByID(hurtResultVO.atkorID) as BaseRole;
				if(hurtResultVO.atkor == null)
				{
					GameLog.addShow("攻击者为空!攻击者服务器ID为：\t" + resultInfo.attackerId.ToString());
				}
							
				if(hurtResultVO.atkor && hurtResultVO.atkor.usable)
				{
					hurtResultVO.atkorPos = new Point(hurtResultVO.atkor.x, hurtResultVO.atkor.z);
				}
				
				if (hurtResultVO.targetRole)
				{
					hurtCharList.push(hurtResultVO.targetRole);
				}
				if (hurtResultVO.targetID == MainRoleManager.actorID) //判定主角是否被攻击
				{
					if (hurtResultVO.atkor /*&& hurtResultVO.atkor.data is HeroData*/) //是玩家才自动反击
					{
						isHited = true;
					}
				}
				
				var stiffTime : Number = 0;//击飞时间，暂时没有，所以先为false
				if (stiffTime > 0)
				{
					hurtResultVO.stiffTime = stiffTime;
				}
				
				var hurtTimes : int = 1; //伤害次数
				for (var hurtTimeI : int = 0; hurtTimeI < hurtTimes; hurtTimeI++) //hp - 3*50 = curLife
				{
					var hurtTypeAmount : int = resultInfo.damage;
					var hurtType : int = resultInfo.fightResult
					var hurtAmount : int = resultInfo.damage; //本次
					var sVo : FightSingleHurt = new FightSingleHurt(hurtType, hurtAmount, hurtResultVO.targetID);
					hurtResultVO.addHurt(sVo);
				}
				hurtList.push(hurtResultVO);
//			}
			
			info.hurtList = hurtList;
			info.isMainCharHited = isHited;
		}
	}
}