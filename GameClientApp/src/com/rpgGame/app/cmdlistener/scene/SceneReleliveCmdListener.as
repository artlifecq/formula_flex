package com.rpgGame.app.cmdlistener.scene
{
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.GameCameraManager;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.info.scene.DieInfo;
	import com.rpgGame.coreData.lang.LangRelive;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.EnumHurtType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.netData.map.bean.PlayerInfo;
	
	import flash.utils.ByteArray;
	
	import app.cmd.SceneModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;


	/**
	 * 复活面板
	 * @author luguozheng
	 *
	 */
	public class SceneReleliveCmdListener extends BaseBean
	{

		public function SceneReleliveCmdListener()
		{
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_YOU_ARE_DEAD, sceneYouAreDead);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_RELIVE_FAIL, heroReliveFail);
//			SocketConnection.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_PERFECT_RELIVE_BROADCAST, perfectReliveBroadcast);
			//折扣相关的
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_ORIGIN_RELIVE_DISCOUNT_TIME_CHANGED, originReliveDiscountTimeChange);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_ORIGIN_PERFECT_RELIVE_DISCOUNT_TIME_CHANGED, prefectReliveDiscountTimeChange);
			
			//复活之后相关的
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_RELIVE_IN_SAME_SCENE, townReliveAndSameScene);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_RELIVED_BROADCAST, heroReliveBroadcast);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_RELIVE, heroRelive);
			ReliveManager.init();
			finish();
		}
		
		private function prefectReliveDiscountTimeChange(buffer:ByteBuffer):void
		{
			var time:Number = buffer.readVarint64();
			var discount:int = buffer.readVarint32();
			ReliveManager.setPrefectReliveDiscount(time,discount);
		}
		
		private function originReliveDiscountTimeChange(buffer:ByteBuffer):void
		{
			var time:Number = buffer.readVarint64();
			var discount:int = buffer.readVarint32();
			ReliveManager.setOriginReliveDiscount(time,discount);
		}
		
		/**
		 * 服务器通知客户端已经死亡. 客户端收到此消息1秒后, 弹出死亡复活面板, 并将场景/人物/怪物 颜色抽黑
		 *
		 * 附带
		 *
		 * varint32 可完美复活类型以及击杀者的类型
		 *
		 * 客户端读取方式
		 *
		 * var speicialReliveInfo = byteArray.readVarint32();
		 *      // 复活类型：
		 *      // specialReliveInfo & 1 != 0 // 能够信春哥复活
		 *      // specialReliveInfo & 2 != 0 // 能够伤不起复活
		 *      // specialReliveInfo & 4 != 0 // 能够跑得快复活
		 *
		 * var reliveTime:int64 = byteArray.readVarint64(); // 服务器复活的时间
		 *
		 * var killerType: int = byteArray.readVarint32();
		 *      // killerType 的意义:
		 *      // 0: 英雄
		 *      // 1: 怪物
		 *      // 2: 无名氏 (bug?)
		 *
		 * var killerName:string = byteArray.readUTF()
		 *
		 * //杀手名字
		 * if (killerType == 0){
		 *     // 如果是英雄，再读一个英雄ID
		 *     var killerId:long = byteArray.readVarInt64();
		 *
		 *     var familyName:string = byteArray.readUTF();
		 *
		 *     if(buffer.readable()) {
		 *          country = byteArray.readVarInt32();
		 *     }
		 * }
		 *
		 */
		private function sceneYouAreDead(buffer : ByteBuffer) : void
		{
			var dieInfo : DieInfo = new DieInfo(buffer);
			dieInfo.dieTime = SystemTimeManager.curtTm;
			if(TrusteeshipManager.getInstance().isAutoFightRunning)
				dieInfo.trusteeshipReliveTime = SystemTimeManager.curtTm + ReliveManager.trusteeshipReliveTime;
			ReliveManager.onRecSceneYouAreDead(dieInfo);
		}

		/**
		 * 复活失败
		 *
		 */
		private function heroReliveFail(buffer : ByteBuffer) : void
		{
			var failID : uint = buffer.readVarint32();
			var msg : String;
			switch (failID)
			{
				case 1:
					msg = LangRelive.heroReliveFail_1;
					break;
				case 2:
					msg = LangRelive.heroReliveFail_2;
					break;
				case 3:
					msg = LangRelive.heroReliveFail_3;
					break;
				case 4:
					msg = LangRelive.heroReliveFail_4;
					break;
			}
			NoticeManager.showNotify(msg);

		}

		/**
		 * 英雄将要完美复活广播, 客户端根据复活时刻在英雄对象身上显示倒计时. 如果英雄id是自己, 则关闭复活面板
		 * varint64 英雄id
		 * varint64 复活时刻
		 */
		private function perfectReliveBroadcast(buffer : ByteBuffer) : void
		{
			var heroId : Number = buffer.readVarint64();
			var reliveTime : Number = buffer.readVarint64();

			//NoticeManager.notify( NoticeManager.CENTER_BOTTOM, "恭喜您，已经完美复活！" );

			ReliveManager.onRecPerfectReliveBroadcast(heroId, reliveTime);
		}

		/**
		 * 英雄复活, 复活场景就是本场景. 可能是完美复活, 也有可能是回城复活,
		 * 但是回城复活的场景正好就是同一个场景. 播放复活特效
		 * 后面附带进入场景消息 S2C_SCENE_ENTER 后面附带的内容 (不包括第一个varint32的当前线的字段)
		 */
		private function townReliveAndSameScene(buffer : ByteBuffer) : void
		{
			var tX : int = buffer.readVarint32();
			var tY : int = buffer.readVarint32();

			var hp : int = buffer.readVarint32();
			var maxHp : int = buffer.readVarint32();
			
			var mp : int= buffer.readVarint64();
			var mana : int = buffer.readVarint64();

			var playerData : HeroData = MainRoleManager.actorInfo;
			if (playerData == null)
				return;

			playerData.x = tX;
			playerData.y = tY;
			playerData.totalStat.hp = hp;
			playerData.totalStat.life = maxHp;
			playerData.totalStat.mp = mp;
			playerData.totalStat.mana = mana;
			
			FightFaceHelper.showAttChange(EnumHurtType.ADDHP, hp);
//			FightFaceHelper.showAttChange(EnumHurtType.ADDMP, mp);
//			FightFaceHelper.showHurtText(MainRoleManager.actor,MainRoleManager.actor,EnumHurtType.SPELL_HURT_TYPE_NORMAL,+hp);
//			FightFaceHelper.showHurtText(MainRoleManager.actor,MainRoleManager.actor,EnumHurtType.SPELL_HURT_TYPE_NORMAL,+mp);
//			TrusteeshipManager.getInstance().stopAll();
			MainRoleManager.updateActorStatus();
			CharAttributeManager.setCharMp(MainRoleManager.actorInfo, MainRoleManager.actorInfo.totalStat.mp);
			GameCameraManager.tryUseCameraProperty();
			//to do 给自己播放一个复活特效 
			SpellAnimationHelper.addTargetEffect(MainRoleManager.actor, 
				RenderUnitID.LEVEL, 
				RenderUnitType.LEVEL, 
				EffectUrl.RELIVE_NORMAL);
		}

		/**
		 * 视野里的英雄完美复活了. 这时这人应该是个尸体. 如果当前视野里没有这人, 忽略(不要添加这人到场景)
		 * 就算不是尸体, 不管, 删除视野里原来那人, 以这条消息附带的内容新添加这个英雄, 并在他身上播放复活特效
		 * 只会广播给英雄周围的人. 英雄自己收到的是S2C_SCENE_HERO_TOWN_RELIVE_AND_SAME_SCENE消息
		 * 附带添加英雄消息 S2C_ADD_HERO 消息后面的内容
		 *
		 */
		private function heroReliveBroadcast(buffer : ByteArray) : void
		{
			var data : HeroData = new HeroData();
			
			var info : PlayerInfo = new PlayerInfo();
			info.read(buffer);
			
			HeroData.setEnterEyeUserInfo(data, info);
			var role : SceneRole = SceneRoleManager.getInstance().createHero(data);
			if(info.keyValueList&&role){
				(role.headFace as HeadFace).updateGuildWarInfoBar(info.keyValueList);
			}
			//to do 给这个人播放一个复活特效 
			SpellAnimationHelper.addTargetEffect(role, 
				RenderUnitID.LEVEL, 
				RenderUnitType.LEVEL, 
				EffectUrl.RELIVE_NORMAL);

		}

		/**
		 * 英雄复活了
		 *
		 * varint32 复活类型
		 * 0. 表示回城复活，清掉原地复活/完美复活的次数
		 * 1. 表示免费原地复活
		 * 2. 表示花钱原地复活，增加一次原地复活的次数
		 * 3. 表示花钱原地完美复活，增加一次原地完美复活的次数
		 * 4. 表示信春哥
		 * 5. 表示伤不起
		 */
		private function heroRelive(buffer : ByteBuffer) : void
		{
			ReliveManager.changeReliveTime(buffer.readVarint32());
			ReliveManager.hideRelivePanel();
		}


	}
}
