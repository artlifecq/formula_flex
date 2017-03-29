package com.rpgGame.app.manager.fight
{
	import com.game.engine3D.controller.CameraController;
	import com.game.mainCore.libCore.handle.HandleThread;
	import com.gameClient.alert.AlertPanel;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.EnumHurtType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import gs.TimelineLite;
	import gs.TweenLite;
	import gs.TweenMax;
	import gs.easing.Circ;
	import gs.easing.Cubic;
	import gs.easing.Elastic;
	import gs.easing.Linear;
	
	import starling.display.DisplayObject;

	/**
	 * 飘字管理
	 * head控制器(除换装外的一切)
	 * @author
	 *
	 */
	public class FightFaceHelper
	{
		/** 根路径 **/
		public static const ROOT : String = "ui/pngx/fight/";
		//---------------------------文字------------------------------------------//
		/** 有用，正面特效，其实就是图片是绿色的**/
		public static const USESFUL_EFFECT : String = "fight_effect/usesful_effect/";
		/** 无用，反面特效，其实就是图片是红色的**/
		public static const HARMFUL_EFFECT : String = "fight_effect/harmful_effect/";
		
		/** 有用，正面特效，其实就是图片是绿色的**/
		public static const ATTRIBUTE_USESFUL_EFFECT : String = "attribute_effect/usesful_effect/";
		/** 无用，反面特效，其实就是图片是红色的**/
		public static const ATTRIBUTE_HARMFUL_EFFECT : String = "attribute_effect/harmful_effect/";
		//-----------------------数字------------------------------------------//
		/** 战斗-目标飘字 受伤**/
		public static const NUMBER_NPC_HIT : String = "skin_shanghai/";
		/** 战斗-自身飘字 回血**/
		public static const NUMBER_PC_HPREC : String = "skin_zhiliao/";
		/** 战斗-自身飘字 掉血**/
		public static const NUMBER_PC_HPSUB : String = "skin_shoushanghai/";
		/**  经验增加**/
		public static const NUMBER_PC_EXP : String = "skin_jingyan/";
		/** 战斗-目标飘字 受暴击**/
		public static const NUMBER_NPC_CRIT : String = "skin_baoji/";
		
		
		/** 战斗-自身飘字 受伤 (红色) **/
		public static const NUMBER_PC_HIT : String = "pc_hit/";
		/** 战斗-自身飘字 受暴击(暗红色) **/
		public static const NUMBER_PC_HITCRIT : String = "pc_hitcrit/";
		/** 战斗-自身飘字 回蓝（深蓝色） **/
		public static const NUMBER_PC_MPREC : String = "pc_mprec/";
		/** 其他飘字 武勋增加（深黄色）**/
		public static const NUMBER_PC_EXPLOIT : String = "pc_exploit/";
		/** 其他飘字 特殊经验加成（紫色）**/
		public static const NUMBER_PC_EXPSPEC : String = "pc_expspec/";
		/** 加号 **/
		public static const NUMBER_JIA : String = "jia";
		/** 减号 **/
		public static const NUMBER_JIAN : String = "jian";
		/** 飘字队列 **/
		private static var _queueThread : HandleThread = new HandleThread(null, true, 20);

		//-----------------------下面是旧版的飘字（暂时留着，整理完新版的再干掉）--------------------------------------------------------------------//
		/** 蓝 数字**/
		public static const NUMBER_BULE : String = "bule1_num/";
		/** 金 数字**/
		public static const NUMBER_GOLD1 : String = "gold1_num/";
		/** 绿 数字**/
		public static const NUMBER_GREEN1 : String = "green1_num/";
		/** 红1 数字**/
		public static const NUMBER_RED1 : String = "red1_num/";
		/** 红2 数字**/
		public static const NUMBER_RED2 : String = "red2_num/";
		/** 橙色 数字**/
		public static const NUMBER_ORANGE1 : String = "orange1_num/";
		/** 紫 数字**/
		public static const NUMBER_PURPLE1 : String = "purple1_num/";
		/** 黄1 数字**/
		public static const NUMBER_YELLOW1 : String = "yellow1_num/";
		/** 黄2 数字**/
		public static const NUMBER_YELLOW2 : String = "yellow2_num/";

		/**
		 * 得到攻击效果的指定类型的URL
		 * @param hurtType 伤害类型
		 * @param isUsesful	是否正面效果，相对主角自己而言的
		 * @return
		 *
		 */
		public static function getFightURlByAttType(hurtType : String, isUsesful : Boolean) : String
		{
			return ROOT+USESFUL_EFFECT+hurtType+".png";
		}

		/**
		 * 人物属性字
		 * @param type 类型
		 * @param isUsesful 是否是正面效果
		 * @return
		 *
		 */
		public static function getAttributeUrl(type : int, isUsesful : Boolean) : String
		{
			if (isUsesful)
				return ROOT + ATTRIBUTE_USESFUL_EFFECT + type + ".png";
			else
				return ROOT + ATTRIBUTE_HARMFUL_EFFECT + type + ".png";
		}

		/**
		 * 根据数字资源类型得到单字数字URL
		 * @param numberType	参考：  NUMBER_BULE
		 * @param number		根据数字，0-9、jia( NUMBER_JIA)、jian
		 * @return
		 *
		 */
		public static function getNumberURLByType(numberType : String, number : String) : String
		{
			return ROOT + numberType + number + ".png";
		}

		/**
		 * 伤害飘字
		 * @param atkor 场景角色
		 * @param hurter 受伤害的角色
		 * @param hurtType 飘字类型 【 0. 普通. 1. 闪避, 2. 暴击, 3. 重击, 4. 跳闪，5.无敌，6.物理免疫，7.魔法免疫，8.反弹，9.目标吸收伤害，10.角色吸收伤害 】
		 * @param hurtAmount 伤害数值
		 *
		 */
		public static function showHurtText(atkor : SceneRole, hurter : SceneRole, hurtType : uint, hurtAmount : int) : void
		{
			if (hurter == null)
				return;

			var mainPlayer : SceneRole = MainRoleManager.actor; //主角
			var typeRes : String=""; //得到攻击效果的指定类型的URL
			var isUsefulBmp : Boolean = true; //是否正面效果，相对主角自己而言的
			var numberType : String ; //飘字数字颜色类型
			var tweenDis : int;
			var dirVec : Vector3D;
			var tweenFun : Function; //飘字回调
			var from : Point; //起始点
			var end : Point; //结束点
			var scaleAgo : Number = 0; //飘字缩放--前
			var scaleLater : Number = 0; //飘字缩放--后

			switch (hurtType)
			{
				case EnumHurtType.SPELL_HURT_TYPE_REBOUND:
				case EnumHurtType.SPELL_HURT_TYPE_INVINCIBLE: 
				case EnumHurtType.SPELL_HURT_TYPE_NORMAL: 
					typeRes = "";
					isUsefulBmp = hurter.isMainChar;
					scaleAgo = 1.5;
					scaleLater = 0.5;
					numberType = NUMBER_NPC_HIT;
					if(isUsefulBmp){
						numberType=NUMBER_PC_HPSUB;
					}
					
					if (atkor.id == MainRoleManager.actorID||hurter.id == MainRoleManager.actorID) 
					{
						if( hurtAmount> 0){
							showAttChange(EnumHurtType.ADDHP, hurtAmount);//回血
							return;
						}
					}	
					
					break;
				case EnumHurtType.SPELL_HURT_TYPE_MISS: //闪避
					typeRes = ROOT+USESFUL_EFFECT+"weimingzhong.png";
					scaleAgo = 2;
					scaleLater = 1;
					tweenFun=tweenUp;
					break;
				case EnumHurtType.SPELL_HURT_TYPE_CRIT: //暴击
					typeRes = ROOT+USESFUL_EFFECT+"bao_ji_piao_zi.png";
					scaleAgo = 2;
					scaleLater = 1;
					numberType = NUMBER_NPC_CRIT;
					break;
				default:
					CONFIG::Debug {
					var loginfo:String = "未处理的伤害类型:"+hurtType;
					GameLog.addError(loginfo);
					AlertPanel.showMsg( loginfo, null );
					}
					break;
			}

			if(!tweenFun){
				tweenFun = tweenTypeRoleHurt;
			}
			var showFace:Boolean = false;
			var roleData:RoleData;
			if(atkor && atkor.usable)
			{
				roleData = atkor.data as RoleData;
				if(roleData)
				{
					if(roleData.id == MainRoleManager.actorID || roleData.ownerId == MainRoleManager.actorID)
					{
						showFace = true;
					}
				}
			}
			if(hurter && hurter.usable)
			{
				roleData = hurter.data as RoleData;
				if(roleData)
				{
					if(roleData.id == MainRoleManager.actorID || roleData.ownerId == MainRoleManager.actorID)
					{
						showFace = true;
					}
				}
			}
			if (showFace) //主角或主角所属角色受伤害/攻击...
			{
				var isLeftShow : Boolean = (atkor && hurter) ? (atkor.x - hurter.x >= 0) : false;//攻击者在被攻击者的右侧
				//是否正面效果，相对主角自己而言的   是主角还是场景其他SceneRole，因为主角同时受到攻击的时候，伤害数值同时出现，造成重叠，所以用队列飘字，避免重叠
				/*if (isUsefulBmp)
				{
					showQueueAttackFace(hurter, typeRes, numberType, hurtAmount, scaleAgo, scaleLater, from, end, null, null, tweenFun, isLeftShow);
				}
				elseq
				{*/
					showAttackFace(hurter.headFace, typeRes, numberType, hurtAmount, null, null, tweenFun, from, end, scaleAgo, scaleLater, isLeftShow);
//				}
					if(hurter.data.id!=MainRoleManager.actorID){
						var headFace:HeadFace=hurter.headFace as HeadFace;
						if(headFace && !hurter.stateMachine.isDeadState){
							headFace.showBloodBar();
						}
					}
			}
		}
		
		/**
		 * 角色伤害飘字 （单行飘字。要两行飘字，配合tweenTypeRoleHurt2方法用）
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 * @author 陈鹉光 2016-01-28
		 */
		public static function tweenTypeRoleHurt(attackFace : DisplayObject, $displayObjectContainer:*, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			$scaleAgo=1.6;
			$scaleLater=0.7 ;
			
			attackFace.scaleX = attackFace.scaleY = 1;
			$end=new Point();
			var end2:Point=new Point();
			var random:Number=Math.random();
			$from=new Point(-attackFace.width/2,-50);
			attackFace.y=$from.y+20;
			
			$end.y=-80+50*random;
			isLeftShow=random>0.5;//随机计算
			end2.y=$end.y+30+10*random;
			var randomV:Number=10+random*10;
			var randomV1:Number=attackFace.width-random*50;
			if(isLeftShow){//往左飘
				$from.x-=randomV;
				$end.x=$from.x-randomV;
				end2.x=$end.x-randomV-30;
			}else{
				$from.x+=randomV;
				$end.x=$from.x+randomV;
				end2.x=$end.x+randomV+30;
			}
			attackFace.x=$from.x;
			
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.append(TweenLite.to(attackFace, 0, { x:$from.x,y:$from.y,scaleX: $scaleAgo, scaleY: $scaleAgo,ease:Elastic.easeOut}));//小到大
			timeLine.append(TweenLite.to(attackFace, 0.2, {}));//大到小
			timeLine.append(TweenLite.to(attackFace, 0.2, { x:$end.x,y:$end.y,scaleX: $scaleLater, scaleY: $scaleLater,ease:Circ.easeOut}));//大到小
			timeLine.append(TweenLite.to(attackFace, 0.3, { x:$end.x,y:$end.y,scaleX: $scaleLater+0.1, scaleY: $scaleLater+0.1,alpha:0.8,ease:Cubic.easeOut}));//小到大
			timeLine.append(TweenLite.to(attackFace, 0.5, { x:end2.x,y:end2.y,alpha:0,onComplete: onComplete, onCompleteParams: [attackFace],ease:Cubic.easeOut}));
		}
		
		private static function updateCenter(face:AttackFace):void
		{
			face.x=-face.width/2;
		}

		/**
		 * 显示属性改变
		 * @param type
		 * @param count
		 *
		 */
		public static function showAttChange(type : String, count : int) : void
		{
			var scaleAgo : Number = 1;
			var scaleLater : Number = 0.33;
			var typeRes : String = getFightURlByAttType(type, true);
			var numberColor : String = "";
			switch (type)
			{
				case EnumHurtType.ADDHP: //回血
					numberColor=NUMBER_PC_HPREC;
					scaleAgo=1;
					scaleLater=1;
					showQueueAttackFace(MainRoleManager.actor, typeRes, numberColor, count, scaleAgo, scaleLater, null, null, null, null, tweenUp);
					return;
				case EnumHurtType.ADDMP: //回蓝
					numberColor = NUMBER_PC_MPREC;
					break;
				case EnumHurtType.EXP: //经验
					numberColor = NUMBER_PC_EXP;
					scaleAgo=1;
					scaleLater=1;
					showQueueAttackFace(MainRoleManager.actor, typeRes, numberColor, count, scaleAgo, scaleLater, null, null, null, null, tweenUp);
					return;
				default:
					break;
			}
			showQueueAttackFace(MainRoleManager.actor, typeRes, numberColor, count, scaleAgo, scaleLater, null, null, null, null, tweenTypeRoleHurt);
		}
		
		public static function tweenTypeRoleMiss(attackFace : DisplayObject, $displayObjectContainer:*, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			
			attackFace.x=-attackFace.width/2;
			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			$end=new Point(attackFace.x,attackFace.y);
			
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.2, {scaleX: $scaleLater, scaleY: $scaleLater, ease: Linear.easeOut}));//缩放
			timeLine.append(TweenLite.to(attackFace, 0.5, {x:$end.x,y:$end.y,alpha: 0,onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeIn}));//隐藏
		}
		
		/**
		 *向上飘 
		 * @param attackFace
		 * @param $displayObjectContainer
		 * @param $from
		 * @param $end
		 * @param $scaleAgo
		 * @param $scaleLater
		 * @param isLeftShow
		 * @param onComplete
		 * 
		 */
		public static function tweenUp(attackFace : DisplayObject, $displayObjectContainer:*, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			attackFace.x = -attackFace.width/2;
			attackFace.y =-attackFace.height/2;
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.3, {ease: Linear.easeOut}));//缩放
			timeLine.append(TweenLite.to(attackFace, 0.3, {y:attackFace.y-50,alpha:0,onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeIn}));//隐藏
		}

		/**
		 * 从指定场景对象处飘出一个AttackFace对象
		 * @param $sc 开始飘字的场景对象
		 * @param $attackType 飘字类型
		 * @param numberRes 指定类型的URL
		 * @param $attackValue 飘出的数值
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $specialType 飘出的数值类型
		 * @param $specialPos 飘出的数值的偏移值
		 * @param $tweenFun
		 * @param $isLeftShow
		 * @param $queueTm 延迟毫秒数
		 *
		 */
		public static function showQueueAttackFace($sc : SceneRole, $attackType : String = "", numberRes : String = "", $attackValue : * = 0, $scaleAgo : Number = 1, $scaleLater : Number = 1, $from : Point = null, $end : Point = null, $specialType : String = null, $specialPos : Point = null, $tweenFun : Function = null, $isLeftShow : Boolean = false, $queueTm : uint = 50) : void
		{
			_queueThread.push(showAttackFace, [$sc.headFace, $attackType, numberRes, $attackValue, $specialType, $specialPos, $tweenFun, $from, $end, $scaleAgo, $scaleLater, $isLeftShow], $queueTm);
		}

		/**
		 * 显示一个AttackFace对象
		 * @param showContainer 容器
		 * @param typeRes 指定类型的URL
		 * @param numberRes 飘字数字颜色类型
		 * @param $attackValue 飘出的数值
		 * @param $specialType 飘出的数值类型
		 * @param $specialPos 飘出的数值的偏移值
		 * @param $tweenFun 飘字回调
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param isLeftShow
		 *
		 */
		public static function showAttackFace(showContainer : *, typeRes : String = "", numberRes : String = "", $attackValue : * = 0, $specialType : String = null, $specialPos : Point = null, $tweenFun : Function = null, $from : Point = null, $end : Point = null, $scaleAgo : Number = 1, $scaleLater : Number = 1, isLeftShow : Boolean = false) : void
		{
			if (showContainer == null)
				return;
			var attackFace : AttackFace = AttackFace.createAttackFace(typeRes, numberRes, $attackValue, $specialType, $specialPos);
			attackFace.touchAcross = true;
			attackFace.touchable = false;
			attackFace.touchGroup = false;
			tweenFromSceneChar(showContainer, attackFace, $from, $end, $scaleAgo, $scaleLater, $tweenFun, isLeftShow, onAtackFaceComplete);
		}

		/**
		 *
		 * @param $sc 开始飘字的场景对象
		 * @param $displayObject AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 * @param $queueTm
		 *
		 */
//		public static function showQueueTweenFromSceneChar($sc : SceneRole, $displayObject : AttackFace, $from : Point, $end : Point, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null, $queueTm : uint = 250) : void
//		{
//			_queueThread.push(tweenFromSceneChar, [$sc, $displayObject, $from, $end, $funTween, $isLeftShow, $onComplete], $queueTm);
//		}

		/**
		 * 场景跳字
		 * @param showContainer 容器
		 * @param $displayObject AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 *
		 */
		private static function tweenFromSceneChar(showContainer : *, $displayObject : AttackFace, $from : Point, $end : Point, $scaleAgo : Number = 0, $scaleLater : Number = 0, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null) : void
		{
			tweenFrom(showContainer, $displayObject, $from, $end, $scaleAgo, $scaleLater, $funTween, $isLeftShow, $onComplete);
		}

		/**
		 * 飘字队列
		 * @param $displayObjectContainer 容器
		 * @param $displayObject AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 * @param $queueTm
		 *
		 */
//		private static function showQueueTweenFrom($displayObjectContainer : Sprite, $displayObject : DisplayObject, $from : Point, $end : Point, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null, $queueTm : uint = 250) : void
//		{
//			_queueThread.push(tweenFrom, [$displayObjectContainer, $displayObject, $from, $end, $funTween, $isLeftShow, $onComplete], $queueTm);
//		}

		/**
		 * 场景飘字坐标转换
		 * @param $displayObjectContainer  容器
		 * @param attackFace AttackFace对象
		 * @param $from 起始点
		 * @param $end 结束点
		 * @param $scaleAgo 飘字缩放--前
		 * @param $scaleLater 飘字缩放--后
		 * @param $funTween 回调
		 * @param $isLeftShow
		 * @param $onComplete
		 *
		 */
		private static function tweenFrom($displayObjectContainer : *, attackFace : AttackFace, $from : Point, $end : Point, $scaleAgo : Number = 0, $scaleLater : Number = 0, $funTween : Function = null, $isLeftShow : Boolean = false, $onComplete : Function = null) : void
		{
			if (null == $displayObjectContainer)
			{
				$onComplete(attackFace); // 动画就算不播放，也要调用完成函数
				return;
			}
			$displayObjectContainer.addChild(attackFace);
//			StarlingLayerManager.headFaceLayer.addChild(attackFace);

			if (null != $funTween)
			{
				$funTween(attackFace, $displayObjectContainer, $from, $end, $scaleAgo, $scaleLater, $isLeftShow, $onComplete);
			}
		}

		/**
		 * 动画完成回调
		 * @param $displayObject
		 *
		 */
		private static function onAtackFaceComplete($displayObject : DisplayObject) : void
		{
			var attackFace : AttackFace = $displayObject as AttackFace;
			if (null == attackFace)
				return;

			attackFace.alpha = attackFace.scaleX = attackFace.scaleY = 1;
			//
			TweenLite.killTweensOf(attackFace);
			//从场景中移除
			if (attackFace != null && attackFace.parent != null)
				attackFace.parent.removeChild(attackFace);
			//池回收
			AttackFace.recycleAttackFace(attackFace);
		}

		//---------------------------------------------------     --------以下是运动轨迹函数----   -------------------------------------------------------//

		/**
		 * 自己伤害掉血
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeMyHurt(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -50);
			}
			if (null == $end)
			{
				$end = new Point(0, -200);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);

			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.5, {x: $end.x, y: $end.y, ease: Linear.easeNone}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {scaleX: $scaleLater, scaleY: $scaleLater, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 敌方扣血
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeEnemyHpDecrease(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -60);
			}
			if (null == $end)
			{
				$end = new Point(0, -140);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);

			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.5, {x: $end.x, y: $end.y, ease: Circ.easeOut}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {transformAroundCenter: {scaleX: $scaleLater, scaleY: $scaleLater}, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 对方伤害掉血
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeEnemyHurt(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -130);
			}
			if (null == $end)
			{
				$end = new Point(0, -180);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);
			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			attackFace.scaleX = attackFace.scaleY = 0.2;
			attackFace.alpha = 1;
			$end.x += (-attackFace.width >> 1);
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.1, {x: $end.x, y: $end.y, scaleX: 1, scaleY: 1, ease: Linear.easeOut}));

			var tX : Number = attackFace.x + (isLeftShow ? -1 : 1) * 50;
			var tXAbs : int = Math.abs(tX) / tX;
			//执行缓动
			//然后以抛物线向左右飘50像素.
			var midPos : Point = new Point(tX, $end.y * 1.5);
			var endPos : Point = new Point(tX + tXAbs * 50, $from.y);
			timeLine.append(TweenMax.to(attackFace, 1, {scaleX: $scaleLater, scaleY: $scaleLater, alpha: 0.5, bezier: [{x: midPos.x, y: midPos.y}, {x: endPos.x, y: endPos.y}], onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeNone}), 0.3);
		}

		/**
		 * 属性飘字
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeAttribute(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -60);
			}
			if (null == $end)
			{
				$end = new Point(0, -140);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;

			$end.x += (-attackFace.width >> 1);
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.9, {x: $end.x, y: $end.y, ease: Linear.easeNone}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {scaleX: $scaleLater, scaleY: $scaleLater, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 升级飘字
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeGuJianLevelUp(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point();
			}
			if (null == $end)
			{
				$end = new Point();
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);
			attackFace.alpha = 1;
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 1, {x: $end.x, y: ($end.y * 5 / 6)}));
			timeLine.append(TweenLite.to(attackFace, 0.5, {y: $end.y, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 闪避
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 *
		 */
		public static function tweenTypeBlink(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(-25, -85);
			}
			if (null == $end)
			{
				$end = new Point(-75, -120);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.alpha = 1;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y;
			$end.x += (-attackFace.width >> 1);
			var timeLine : TimelineLite = new TimelineLite();
			timeLine.insert(TweenLite.to(attackFace, 0.7, {x: $end.x, y: $end.y, alpha: 0, ease: Linear.easeNone}));
			timeLine.append(TweenLite.to(attackFace, 0.2, {transformAroundCenter: {scaleX: $scaleLater, scaleY: $scaleLater}, alpha: 0, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeInOut}));
		}

		/**
		 * 角色伤害飘字
		 * @param attackFace 飘字对象
		 * @param $offset 偏移
		 * @param $from 开始点
		 * @param $end 结束点
		 * @param isLeftShow
		 * @param onComplete 飘字完成回调
		 * @author 陈鹉光 2016-01-28
		 */
		public static function tweenTypeRoleHurt2(attackFace : DisplayObject, $offset : Point, $from : Point, $end : Point, $scaleAgo : Number, $scaleLater : Number, isLeftShow : Boolean = false, onComplete : Function = null) : void
		{
			if (null == $from)
			{
				$from = new Point(0, -50);
			}
			if (null == $end)
			{
				$end = new Point(-23, -200);
			}
			$from.offset($offset.x, $offset.y);
			$end.offset($offset.x, $offset.y);

			attackFace.scaleX = attackFace.scaleY = $scaleAgo;
			attackFace.x = (-attackFace.width >> 1) + $from.x;
			attackFace.y = $from.y - 20;

			var timeLine : TimelineLite = new TimelineLite();
			var tiltAngleNum : Number = CameraController.lockedOnPlayerController.tiltAngle; //摄像机角度
			var W : Number = attackFace.width * 0.33;
			var nextX : Number = attackFace.x + attackFace.width / 2 - W / 2; //计算attackFace缩小0.33倍之后的X坐标
			timeLine.insert(TweenLite.to(attackFace, 0.5, {x: nextX, scaleX:$scaleLater, scaleY:$scaleLater, ease: Linear.easeOut}));
			timeLine.append(TweenLite.to(attackFace, 1.2, {alpha: 0, y: $end.y + tiltAngleNum, onComplete: onComplete, onCompleteParams: [attackFace], ease: Linear.easeIn}));
		}

	}
}
