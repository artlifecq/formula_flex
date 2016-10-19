package com.rpgGame.app.manager.sound
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.manager.sound.SimpleMp3Player;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.sound.GameSoundCfgData;
	import com.rpgGame.coreData.clientConfig.GameSoundInfo;
	import com.rpgGame.coreData.enum.sound.CountryWarSoundEnum;
	import com.rpgGame.coreData.enum.sound.GameSoundType;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.ds.HashMap;

	public class GameSoundManager
	{
		/**怪物攻击音效CD时长，单位:毫秒*/
		private static const MONSTER_ACTION_SOUND_WHEN__ATTACK_CD : int = 600;
		/**怪物攻击说话声音CD时长，单位:毫秒*/
		private static const MONSTER_WORD_SOUND_WHEN_ATTACK_CD : int = 30000;
		/**玩家命中音效CD时长，单位:毫秒*/
		private static const PLAYER_ACTION_SOUND_WHEN_HIT_CD : int = 60;
		/**古剑说的话CD时长，单位:毫秒*/
		private static const GUJIAN_WORD_CD : int = 3000;
		/**怪物吼叫音效CD时长，单位:毫秒*/
		private static const MONSTER_BELLOW_SOUND_CD : int = 600;
		/**古剑说的话CD结束时间点，单位:毫秒*/
		private static var _guJianWordCDEndTime : int;
		/**怪物攻击CD时间结束点，单位:毫秒*/
		private static var _monsterActionSoundWhenAttackCDEndTime : int;
		/**怪物攻击时说话的CD时间结束点，单位:毫秒*/
		private static var _monsterWordSoundWhenAttackCDEndTime : int;
		/**玩家击中声音CD时间结束点，单位:毫秒*/
		private static var _playerActionSoundWhenHitCDEndTime : int;
		/**怪物死亡CD时间结束点，单位:毫秒*/
		private static var _monsterBellowSoundWhenDieCDEndTime : int;
		/**怪物被击吼叫CD时间结束点，单位:毫秒*/
		private static var _monsterBellowSoundWhenHurtCDEndTime : int;
		/**怪物击中音效CD时间结束点，单位:毫秒*/
		private static var _monsterActionSoundWhenHitCDEndTime : int;
		private static var _isBgSoundRun : Boolean;

		private static var _groundTypeSoundHM : HashMap;

		public static function setup() : void
		{
		/*			_groundTypeSoundHM = new HashMap();
					_groundTypeSoundHM.add(EnumSceneGroundType.STONE,"stone");
					_groundTypeSoundHM.add(EnumSceneGroundType.GRASS,"grass");
					_groundTypeSoundHM.add(EnumSceneGroundType.EARTH,"earth");
					_groundTypeSoundHM.add(EnumSceneGroundType.WOOD,"wood");
					_groundTypeSoundHM.add(EnumSceneGroundType.WATER,"water");
					_groundTypeSoundHM.add(EnumSceneGroundType.METAL,"metal");
					_groundTypeSoundHM.add(EnumSceneGroundType.CARPET,"carpet");
					TSoundManager.setup();
					PosSoundManager.setup();*/
		}

		public static function stopBgSound() : void
		{
			SimpleMp3Player.player.stop();
		}

		/**
		 *更新声音播放设置
		 *
		 */
		public static function updateMusicSetting() : void
		{
			//TSoundManager.setBgSoundMute(ClientSettingManager.isCloseMusic() || !DisplaySettingManager.fpIsActive || !_isBgSoundRun);
		}

		/**
		 *更新音效播放设置
		 *
		 */
		public static function updateSoundEffectSetting() : void
		{
			//TSoundManager.setShortSoundMute(ClientSettingManager.isCloseSoundEffect() || !DisplaySettingManager.fpIsActive);
		}

		/**
		 *更新环境音乐播放设置
		 *
		 */
		public static function updateEnvironmentSoundSetting() : void
		{
			//TSoundManager.setEnvironmentMute(ClientSettingManager.isCloseEnvironmentSound() || !DisplaySettingManager.fpIsActive);
		}

		/**
		 * 按类型播放
		 * @param $type
		 * @param $id
		 * @param $isWord
		 *
		 */
		public static function play($type : int, $id : int, $isWord : Boolean = false) : void
		{
			var info : GameSoundInfo = GameSoundCfgData.getInfo($type, $id);
			if (!info || info.repeat < 0)
			{
				return;
			}
			if (info.playChance < 100)
			{
				var random : int = Math.random() * 100;
				if (random < info.playChance)
				{
					return;
				}
			}
			var name : String = GameSoundCfgData.getSoundName($type, $id);
			if (name && name.length)
			{
				if ($isWord)
				{
					playWordSound(name, 1);
				}
				else
				{
					var url : String = ClientConfig.getSound(name);
					switch ($type)
					{
						case GameSoundType.COUNTRY_WAR_ATTACEK:
						case GameSoundType.COUNTRY_WAR_DEFENDER:
							if ($id == CountryWarSoundEnum.START)
							{
								SimpleMp3Player.player.play(url, int.MAX_VALUE);
							}
							else
							{
								SimpleMp3Player.playOnce(url);
							}
							break;
						default:
							SimpleMp3Player.playOnce(url);
							break;
					}
				}
			}
		}

		/**
		 * 按资源名称播放
		 * @param $name
		 *
		 */
		public static function playByName($name : String) : void
		{
			if ($name && $name.length)
			{
				var url : String = ClientConfig.getSound($name);
				SimpleMp3Player.playOnce(url);
			}
		}

		/**
		 * 播放走路声音
		 * @param $sceneChar
		 * @param $auto 是否是初次播放
		 *
		 */
		public static function playWalkSound($sceneChar : SceneRole, $first : Boolean = true) : void
		{
			if ($first && TSoundManager.isPlayingWalkSound())
			{
				return;
			}
			var name : String = getWalkSoundName($sceneChar);
			if (name && name.length)
			{
				var url : String = ClientConfig.getSound(name);
				TSoundManager.playWalkSound(url, onSoundOneLoopCmp);
			}
			function onSoundOneLoopCmp(... args) : void
			{
				playWalkSound($sceneChar, false);
			}
		}

		private static function getWalkSoundName($sceneChar : SceneRole) : String
		{
			var groundType : int = 0; //SceneGroundCfgData.getGroundType(MapDataManager.getCurrentMapInfo().id,$sceneChar.x,$sceneChar.y);
			var soundType : String = _groundTypeSoundHM.getValue(groundType);
			var randomNum : int = int(Math.random() * 4) + 1;
			var soundName : String = "RUN_" + soundType + "_" + randomNum;
			return soundName;
		}

		/**
		 * 播放普通npc说的话
		 * @param npcID
		 *
		 */
		public static function playNPCDialogWordSound(npcID : int) : void
		{
//			var name:String = NpcCfgData.getSoundRes(npcID);
//			if(name && name.length)
//			{
//				var npcData:NpcProto = MonsterDataManager.getData(npcID);
//				playWordSound(name,1,npcData.posX,npcData.posY);
//			}
		}

		/**
		 * 播放任务npc说的话
		 * @param $name
		 *
		 */
		public static function playNPCTaskWordSound(taskID : int, npcID : int) : void
		{
		/*			var name:String = GameSoundCfgData.getSoundName(GameSoundType.NPC_TASK_DIALOG,taskID);
					if(name && name.length)
					{
						var npcData:NpcProto = MonsterDataManager.getData(npcID);
						playWordSound(name,1,npcData.posX,npcData.posY);
					}
					else
					{
						playNPCDialogWordSound(npcID);
					}*/
		}

		/**
		 * 播放说话声音
		 * @param $name
		 * @param priority
		 *
		 */
		public static function playWordSound(name : String, priority : int = 0, $x : int = -1, $y : int = -1) : void
		{
			if (name && name.length)
			{
				var url : String = ClientConfig.getSound(name);
				_guJianWordCDEndTime = getTimer() + GUJIAN_WORD_CD;
				SimpleMp3Player.playOnce(url);
			}
		}

		/**
		 * 播放怪物攻击时的说话声音
		 * @param cfgID
		 *
		 */
		public static function playMonsterWordSoundWhenAttack(cfgID : int) : void
		{
			var currentTime : int = getTimer();
			if (_monsterWordSoundWhenAttackCDEndTime < currentTime)
			{
//				var soundName : String = MonsterCfgData.getMonsterWordSoundWhenAttack(cfgID);
//				if (soundName && soundName.length)
//				{
//					_monsterWordSoundWhenAttackCDEndTime = currentTime + MONSTER_WORD_SOUND_WHEN_ATTACK_CD;
//					playWordSound(soundName);
//				}
			}
		}

	}
}
