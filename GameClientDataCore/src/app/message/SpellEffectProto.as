package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class SpellEffectProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_MOTION_ID:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.attack_motion_id", "attackMotionId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_motion_id$field:int;

		public function clearAttackMotionId():void {
			hasField$0 &= 0xfffffffd;
			attack_motion_id$field = new int();
		}

		public function get hasAttackMotionId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set attackMotionId(value:int):void {
			hasField$0 |= 0x2;
			attack_motion_id$field = value;
		}

		public function get attackMotionId():int {
			return attack_motion_id$field;
		}

		/**
		 *  @private
		 */
		public static const ATTACK_MOTION_SPEED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.attack_motion_speed", "attackMotionSpeed", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var attack_motion_speed$field:int;

		public function clearAttackMotionSpeed():void {
			hasField$0 &= 0xfffffffb;
			attack_motion_speed$field = new int();
		}

		public function get hasAttackMotionSpeed():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set attackMotionSpeed(value:int):void {
			hasField$0 |= 0x4;
			attack_motion_speed$field = value;
		}

		public function get attackMotionSpeed():int {
			return attack_motion_speed$field;
		}

		/**
		 *  @private
		 */
		public static const HURT_DELAY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.hurt_delay", "hurtDelay", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hurt_delay$field:int;

		public function clearHurtDelay():void {
			hasField$0 &= 0xfffffff7;
			hurt_delay$field = new int();
		}

		public function get hasHurtDelay():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set hurtDelay(value:int):void {
			hasField$0 |= 0x8;
			hurt_delay$field = value;
		}

		public function get hurtDelay():int {
			return hurt_delay$field;
		}

		/**
		 *  @private
		 */
		public static const CAST_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.cast_time", "castTime", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cast_time$field:int;

		public function clearCastTime():void {
			hasField$0 &= 0xffffffef;
			cast_time$field = new int();
		}

		public function get hasCastTime():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set castTime(value:int):void {
			hasField$0 |= 0x10;
			cast_time$field = value;
		}

		public function get castTime():int {
			return cast_time$field;
		}

		/**
		 *  @private
		 */
		public static const DELAY_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.delay_time", "delayTime", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var delay_time$field:int;

		public function clearDelayTime():void {
			hasField$0 &= 0xffffffdf;
			delay_time$field = new int();
		}

		public function get hasDelayTime():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set delayTime(value:int):void {
			hasField$0 |= 0x20;
			delay_time$field = value;
		}

		public function get delayTime():int {
			return delay_time$field;
		}

		/**
		 *  @private
		 */
		public static const CAST_ANIMATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.cast_animation", "castAnimation", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cast_animation$field:int;

		public function clearCastAnimation():void {
			hasField$0 &= 0xffffffbf;
			cast_animation$field = new int();
		}

		public function get hasCastAnimation():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set castAnimation(value:int):void {
			hasField$0 |= 0x40;
			cast_animation$field = value;
		}

		public function get castAnimation():int {
			return cast_animation$field;
		}

		/**
		 *  @private
		 */
		public static const SELF_DEST_ANIMATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.self_dest_animation", "selfDestAnimation", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var self_dest_animation$field:int;

		public function clearSelfDestAnimation():void {
			hasField$0 &= 0xffffff7f;
			self_dest_animation$field = new int();
		}

		public function get hasSelfDestAnimation():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set selfDestAnimation(value:int):void {
			hasField$0 |= 0x80;
			self_dest_animation$field = value;
		}

		public function get selfDestAnimation():int {
			return self_dest_animation$field;
		}

		/**
		 *  @private
		 */
		public static const HURT_ANIMATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.hurt_animation", "hurtAnimation", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hurt_animation$field:int;

		public function clearHurtAnimation():void {
			hasField$0 &= 0xfffffeff;
			hurt_animation$field = new int();
		}

		public function get hasHurtAnimation():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set hurtAnimation(value:int):void {
			hasField$0 |= 0x100;
			hurt_animation$field = value;
		}

		public function get hurtAnimation():int {
			return hurt_animation$field;
		}

		/**
		 *  @private
		 */
		public static const DEST_ANIMATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dest_animation", "destAnimation", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dest_animation$field:int;

		public function clearDestAnimation():void {
			hasField$0 &= 0xfffffdff;
			dest_animation$field = new int();
		}

		public function get hasDestAnimation():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set destAnimation(value:int):void {
			hasField$0 |= 0x200;
			dest_animation$field = value;
		}

		public function get destAnimation():int {
			return dest_animation$field;
		}

		/**
		 *  @private
		 */
		public static const SPUTTERING_HURT_ANIMATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.sputtering_hurt_animation", "sputteringHurtAnimation", (33 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sputtering_hurt_animation$field:int;

		public function clearSputteringHurtAnimation():void {
			hasField$0 &= 0xfffffbff;
			sputtering_hurt_animation$field = new int();
		}

		public function get hasSputteringHurtAnimation():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set sputteringHurtAnimation(value:int):void {
			hasField$0 |= 0x400;
			sputtering_hurt_animation$field = value;
		}

		public function get sputteringHurtAnimation():int {
			return sputtering_hurt_animation$field;
		}

		/**
		 *  @private
		 */
		public static const FLY_ANIMATION:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.fly_animation", "flyAnimation", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fly_animation$field:int;

		public function clearFlyAnimation():void {
			hasField$0 &= 0xfffff7ff;
			fly_animation$field = new int();
		}

		public function get hasFlyAnimation():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set flyAnimation(value:int):void {
			hasField$0 |= 0x800;
			fly_animation$field = value;
		}

		public function get flyAnimation():int {
			return fly_animation$field;
		}

		/**
		 *  @private
		 */
		public static const FLY_SPEED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.fly_speed", "flySpeed", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fly_speed$field:int;

		public function clearFlySpeed():void {
			hasField$0 &= 0xffffefff;
			fly_speed$field = new int();
		}

		public function get hasFlySpeed():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set flySpeed(value:int):void {
			hasField$0 |= 0x1000;
			fly_speed$field = value;
		}

		public function get flySpeed():int {
			return fly_speed$field;
		}

		/**
		 *  @private
		 */
		public static const FLY_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.fly_time", "flyTime", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fly_time$field:int;

		public function clearFlyTime():void {
			hasField$0 &= 0xffffdfff;
			fly_time$field = new int();
		}

		public function get hasFlyTime():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set flyTime(value:int):void {
			hasField$0 |= 0x2000;
			fly_time$field = value;
		}

		public function get flyTime():int {
			return fly_time$field;
		}

		/**
		 *  @private
		 */
		public static const IS_FLY_CROSS:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.is_fly_cross", "isFlyCross", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_fly_cross$field:Boolean;

		public function clearIsFlyCross():void {
			hasField$0 &= 0xffffbfff;
			is_fly_cross$field = new Boolean();
		}

		public function get hasIsFlyCross():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set isFlyCross(value:Boolean):void {
			hasField$0 |= 0x4000;
			is_fly_cross$field = value;
		}

		public function get isFlyCross():Boolean {
			return is_fly_cross$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TRACK_TARGET:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.is_track_target", "isTrackTarget", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_track_target$field:Boolean;

		public function clearIsTrackTarget():void {
			hasField$0 &= 0xffff7fff;
			is_track_target$field = new Boolean();
		}

		public function get hasIsTrackTarget():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set isTrackTarget(value:Boolean):void {
			hasField$0 |= 0x8000;
			is_track_target$field = value;
		}

		public function get isTrackTarget():Boolean {
			return is_track_target$field;
		}

		/**
		 *  @private
		 */
		public static const BLINK_TYPE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.blink_type", "blinkType", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var blink_type$field:int;

		public function clearBlinkType():void {
			hasField$0 &= 0xfffeffff;
			blink_type$field = new int();
		}

		public function get hasBlinkType():Boolean {
			return (hasField$0 & 0x10000) != 0;
		}

		public function set blinkType(value:int):void {
			hasField$0 |= 0x10000;
			blink_type$field = value;
		}

		public function get blinkType():int {
			return blink_type$field;
		}

		/**
		 *  @private
		 */
		public static const BLINK_SPEED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.blink_speed", "blinkSpeed", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		private var blink_speed$field:int;

		public function clearBlinkSpeed():void {
			hasField$0 &= 0xfffdffff;
			blink_speed$field = new int();
		}

		public function get hasBlinkSpeed():Boolean {
			return (hasField$0 & 0x20000) != 0;
		}

		public function set blinkSpeed(value:int):void {
			hasField$0 |= 0x20000;
			blink_speed$field = value;
		}

		public function get blinkSpeed():int {
			return blink_speed$field;
		}

		/**
		 *  @private
		 */
		public static const BLINK_HEIGHT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.blink_height", "blinkHeight", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		private var blink_height$field:int;

		public function clearBlinkHeight():void {
			hasField$0 &= 0xfffbffff;
			blink_height$field = new int();
		}

		public function get hasBlinkHeight():Boolean {
			return (hasField$0 & 0x40000) != 0;
		}

		public function set blinkHeight(value:int):void {
			hasField$0 |= 0x40000;
			blink_height$field = value;
		}

		public function get blinkHeight():int {
			return blink_height$field;
		}

		/**
		 *  @private
		 */
		public static const BEAT_BACK_SPEED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.beat_back_speed", "beatBackSpeed", (27 << 3) | com.netease.protobuf.WireType.VARINT);

		private var beat_back_speed$field:int;

		public function clearBeatBackSpeed():void {
			hasField$0 &= 0xfff7ffff;
			beat_back_speed$field = new int();
		}

		public function get hasBeatBackSpeed():Boolean {
			return (hasField$0 & 0x80000) != 0;
		}

		public function set beatBackSpeed(value:int):void {
			hasField$0 |= 0x80000;
			beat_back_speed$field = value;
		}

		public function get beatBackSpeed():int {
			return beat_back_speed$field;
		}

		/**
		 *  @private
		 */
		public static const CAN_WALK_RELEASE:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.can_walk_release", "canWalkRelease", (28 << 3) | com.netease.protobuf.WireType.VARINT);

		private var can_walk_release$field:Boolean;

		public function clearCanWalkRelease():void {
			hasField$0 &= 0xffefffff;
			can_walk_release$field = new Boolean();
		}

		public function get hasCanWalkRelease():Boolean {
			return (hasField$0 & 0x100000) != 0;
		}

		public function set canWalkRelease(value:Boolean):void {
			hasField$0 |= 0x100000;
			can_walk_release$field = value;
		}

		public function get canWalkRelease():Boolean {
			return can_walk_release$field;
		}

		/**
		 *  @private
		 */
		public static const REPEAT_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.repeat_times", "repeatTimes", (29 << 3) | com.netease.protobuf.WireType.VARINT);

		private var repeat_times$field:int;

		public function clearRepeatTimes():void {
			hasField$0 &= 0xffdfffff;
			repeat_times$field = new int();
		}

		public function get hasRepeatTimes():Boolean {
			return (hasField$0 & 0x200000) != 0;
		}

		public function set repeatTimes(value:int):void {
			hasField$0 |= 0x200000;
			repeat_times$field = value;
		}

		public function get repeatTimes():int {
			return repeat_times$field;
		}

		/**
		 *  @private
		 */
		public static const REPEAT_INTERVAL:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.repeat_interval", "repeatInterval", (30 << 3) | com.netease.protobuf.WireType.VARINT);

		private var repeat_interval$field:int;

		public function clearRepeatInterval():void {
			hasField$0 &= 0xffbfffff;
			repeat_interval$field = new int();
		}

		public function get hasRepeatInterval():Boolean {
			return (hasField$0 & 0x400000) != 0;
		}

		public function set repeatInterval(value:int):void {
			hasField$0 |= 0x400000;
			repeat_interval$field = value;
		}

		public function get repeatInterval():int {
			return repeat_interval$field;
		}

		/**
		 *  @private
		 */
		public static const MAX_HURT_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.max_hurt_times", "maxHurtTimes", (31 << 3) | com.netease.protobuf.WireType.VARINT);

		private var max_hurt_times$field:int;

		public function clearMaxHurtTimes():void {
			hasField$0 &= 0xff7fffff;
			max_hurt_times$field = new int();
		}

		public function get hasMaxHurtTimes():Boolean {
			return (hasField$0 & 0x800000) != 0;
		}

		public function set maxHurtTimes(value:int):void {
			hasField$0 |= 0x800000;
			max_hurt_times$field = value;
		}

		public function get maxHurtTimes():int {
			return max_hurt_times$field;
		}

		/**
		 *  @private
		 */
		public static const IS_TRAP_SPELL:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.is_trap_spell", "isTrapSpell", (32 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_trap_spell$field:Boolean;

		public function clearIsTrapSpell():void {
			hasField$0 &= 0xfeffffff;
			is_trap_spell$field = new Boolean();
		}

		public function get hasIsTrapSpell():Boolean {
			return (hasField$0 & 0x1000000) != 0;
		}

		public function set isTrapSpell(value:Boolean):void {
			hasField$0 |= 0x1000000;
			is_trap_spell$field = value;
		}

		public function get isTrapSpell():Boolean {
			return is_trap_spell$field;
		}

		/**
		 *  @private
		 */
		public static const CAROM_START_FRAME_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.carom_start_frame_time", "caromStartFrameTime", (50 << 3) | com.netease.protobuf.WireType.VARINT);

		private var carom_start_frame_time$field:int;

		public function clearCaromStartFrameTime():void {
			hasField$0 &= 0xfdffffff;
			carom_start_frame_time$field = new int();
		}

		public function get hasCaromStartFrameTime():Boolean {
			return (hasField$0 & 0x2000000) != 0;
		}

		public function set caromStartFrameTime(value:int):void {
			hasField$0 |= 0x2000000;
			carom_start_frame_time$field = value;
		}

		public function get caromStartFrameTime():int {
			return carom_start_frame_time$field;
		}

		/**
		 *  @private
		 */
		public static const HIT_FRAME_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.hit_frame_time", "hitFrameTime", (51 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hit_frame_time$field:int;

		public function clearHitFrameTime():void {
			hasField$0 &= 0xfbffffff;
			hit_frame_time$field = new int();
		}

		public function get hasHitFrameTime():Boolean {
			return (hasField$0 & 0x4000000) != 0;
		}

		public function set hitFrameTime(value:int):void {
			hasField$0 |= 0x4000000;
			hit_frame_time$field = value;
		}

		public function get hitFrameTime():int {
			return hit_frame_time$field;
		}

		/**
		 *  @private
		 */
		public static const BREAK_FRAME_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.break_frame_time", "breakFrameTime", (52 << 3) | com.netease.protobuf.WireType.VARINT);

		private var break_frame_time$field:int;

		public function clearBreakFrameTime():void {
			hasField$0 &= 0xf7ffffff;
			break_frame_time$field = new int();
		}

		public function get hasBreakFrameTime():Boolean {
			return (hasField$0 & 0x8000000) != 0;
		}

		public function set breakFrameTime(value:int):void {
			hasField$0 |= 0x8000000;
			break_frame_time$field = value;
		}

		public function get breakFrameTime():int {
			return break_frame_time$field;
		}

		/**
		 *  @private
		 */
		public static const SOAR_FRAME_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.soar_frame_time", "soarFrameTime", (53 << 3) | com.netease.protobuf.WireType.VARINT);

		private var soar_frame_time$field:int;

		public function clearSoarFrameTime():void {
			hasField$0 &= 0xefffffff;
			soar_frame_time$field = new int();
		}

		public function get hasSoarFrameTime():Boolean {
			return (hasField$0 & 0x10000000) != 0;
		}

		public function set soarFrameTime(value:int):void {
			hasField$0 |= 0x10000000;
			soar_frame_time$field = value;
		}

		public function get soarFrameTime():int {
			return soar_frame_time$field;
		}

		/**
		 *  @private
		 */
		public static const THROW_DELAY_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.throw_delay_time", "throwDelayTime", (54 << 3) | com.netease.protobuf.WireType.VARINT);

		private var throw_delay_time$field:int;

		public function clearThrowDelayTime():void {
			hasField$0 &= 0xdfffffff;
			throw_delay_time$field = new int();
		}

		public function get hasThrowDelayTime():Boolean {
			return (hasField$0 & 0x20000000) != 0;
		}

		public function set throwDelayTime(value:int):void {
			hasField$0 |= 0x20000000;
			throw_delay_time$field = value;
		}

		public function get throwDelayTime():int {
			return throw_delay_time$field;
		}

		/**
		 *  @private
		 */
		public static const GHOST_EFFECT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.ghost_effect", "ghostEffect", (55 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ghost_effect$field:Boolean;

		public function clearGhostEffect():void {
			hasField$0 &= 0xbfffffff;
			ghost_effect$field = new Boolean();
		}

		public function get hasGhostEffect():Boolean {
			return (hasField$0 & 0x40000000) != 0;
		}

		public function set ghostEffect(value:Boolean):void {
			hasField$0 |= 0x40000000;
			ghost_effect$field = value;
		}

		public function get ghostEffect():Boolean {
			return ghost_effect$field;
		}

		/**
		 *  @private
		 */
		public static const MATCH_TERRAIN:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.match_terrain", "matchTerrain", (56 << 3) | com.netease.protobuf.WireType.VARINT);

		private var match_terrain$field:Boolean;

		public function clearMatchTerrain():void {
			hasField$0 &= 0x7fffffff;
			match_terrain$field = new Boolean();
		}

		public function get hasMatchTerrain():Boolean {
			return (hasField$0 & 0x80000000) != 0;
		}

		public function set matchTerrain(value:Boolean):void {
			hasField$0 |= 0x80000000;
			match_terrain$field = value;
		}

		public function get matchTerrain():Boolean {
			return match_terrain$field;
		}

		/**
		 *  @private
		 */
		public static const KEEP_SPACING:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.keep_spacing", "keepSpacing", (57 << 3) | com.netease.protobuf.WireType.VARINT);

		private var keep_spacing$field:int;

		private var hasField$1:uint = 0;

		public function clearKeepSpacing():void {
			hasField$1 &= 0xfffffffe;
			keep_spacing$field = new int();
		}

		public function get hasKeepSpacing():Boolean {
			return (hasField$1 & 0x1) != 0;
		}

		public function set keepSpacing(value:int):void {
			hasField$1 |= 0x1;
			keep_spacing$field = value;
		}

		public function get keepSpacing():int {
			return keep_spacing$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_LAUNCH_HEIGHT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_launch_height", "deadLaunchHeight", (58 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_launch_height$field:int;

		public function clearDeadLaunchHeight():void {
			hasField$1 &= 0xfffffffd;
			dead_launch_height$field = new int();
		}

		public function get hasDeadLaunchHeight():Boolean {
			return (hasField$1 & 0x2) != 0;
		}

		public function set deadLaunchHeight(value:int):void {
			hasField$1 |= 0x2;
			dead_launch_height$field = value;
		}

		public function get deadLaunchHeight():int {
			return dead_launch_height$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_BEAT_DISTANCE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_beat_distance", "deadBeatDistance", (59 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_beat_distance$field:int;

		public function clearDeadBeatDistance():void {
			hasField$1 &= 0xfffffffb;
			dead_beat_distance$field = new int();
		}

		public function get hasDeadBeatDistance():Boolean {
			return (hasField$1 & 0x4) != 0;
		}

		public function set deadBeatDistance(value:int):void {
			hasField$1 |= 0x4;
			dead_beat_distance$field = value;
		}

		public function get deadBeatDistance():int {
			return dead_beat_distance$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_BEAT_SPEED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_beat_speed", "deadBeatSpeed", (60 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_beat_speed$field:int;

		public function clearDeadBeatSpeed():void {
			hasField$1 &= 0xfffffff7;
			dead_beat_speed$field = new int();
		}

		public function get hasDeadBeatSpeed():Boolean {
			return (hasField$1 & 0x8) != 0;
		}

		public function set deadBeatSpeed(value:int):void {
			hasField$1 |= 0x8;
			dead_beat_speed$field = value;
		}

		public function get deadBeatSpeed():int {
			return dead_beat_speed$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_BEAT_PROBABILITY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_beat_probability", "deadBeatProbability", (61 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_beat_probability$field:int;

		public function clearDeadBeatProbability():void {
			hasField$1 &= 0xffffffef;
			dead_beat_probability$field = new int();
		}

		public function get hasDeadBeatProbability():Boolean {
			return (hasField$1 & 0x10) != 0;
		}

		public function set deadBeatProbability(value:int):void {
			hasField$1 |= 0x10;
			dead_beat_probability$field = value;
		}

		public function get deadBeatProbability():int {
			return dead_beat_probability$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_LAUNCH_PROBABILITY:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_launch_probability", "deadLaunchProbability", (62 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_launch_probability$field:int;

		public function clearDeadLaunchProbability():void {
			hasField$1 &= 0xffffffdf;
			dead_launch_probability$field = new int();
		}

		public function get hasDeadLaunchProbability():Boolean {
			return (hasField$1 & 0x20) != 0;
		}

		public function set deadLaunchProbability(value:int):void {
			hasField$1 |= 0x20;
			dead_launch_probability$field = value;
		}

		public function get deadLaunchProbability():int {
			return dead_launch_probability$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_LAUNCH_DISTANCE:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_launch_distance", "deadLaunchDistance", (63 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_launch_distance$field:int;

		public function clearDeadLaunchDistance():void {
			hasField$1 &= 0xffffffbf;
			dead_launch_distance$field = new int();
		}

		public function get hasDeadLaunchDistance():Boolean {
			return (hasField$1 & 0x40) != 0;
		}

		public function set deadLaunchDistance(value:int):void {
			hasField$1 |= 0x40;
			dead_launch_distance$field = value;
		}

		public function get deadLaunchDistance():int {
			return dead_launch_distance$field;
		}

		/**
		 *  @private
		 */
		public static const DEAD_LAUNCH_SPEED:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.dead_launch_speed", "deadLaunchSpeed", (64 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dead_launch_speed$field:int;

		public function clearDeadLaunchSpeed():void {
			hasField$1 &= 0xffffff7f;
			dead_launch_speed$field = new int();
		}

		public function get hasDeadLaunchSpeed():Boolean {
			return (hasField$1 & 0x80) != 0;
		}

		public function set deadLaunchSpeed(value:int):void {
			hasField$1 |= 0x80;
			dead_launch_speed$field = value;
		}

		public function get deadLaunchSpeed():int {
			return dead_launch_speed$field;
		}

		/**
		 *  @private
		 */
		public static const IS_ADAPTIVE_TARGET_HEIGHT:FieldDescriptor_TYPE_BOOL = new FieldDescriptor_TYPE_BOOL("app.message.SpellEffectProto.is_adaptive_target_height", "isAdaptiveTargetHeight", (65 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_adaptive_target_height$field:Boolean;

		public function clearIsAdaptiveTargetHeight():void {
			hasField$1 &= 0xfffffeff;
			is_adaptive_target_height$field = new Boolean();
		}

		public function get hasIsAdaptiveTargetHeight():Boolean {
			return (hasField$1 & 0x100) != 0;
		}

		public function set isAdaptiveTargetHeight(value:Boolean):void {
			hasField$1 |= 0x100;
			is_adaptive_target_height$field = value;
		}

		public function get isAdaptiveTargetHeight():Boolean {
			return is_adaptive_target_height$field;
		}

		/**
		 *  @private
		 */
		public static const THROW_HEIGHT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.throw_height", "throwHeight", (66 << 3) | com.netease.protobuf.WireType.VARINT);

		private var throw_height$field:int;

		public function clearThrowHeight():void {
			hasField$1 &= 0xfffffdff;
			throw_height$field = new int();
		}

		public function get hasThrowHeight():Boolean {
			return (hasField$1 & 0x200) != 0;
		}

		public function set throwHeight(value:int):void {
			hasField$1 |= 0x200;
			throw_height$field = value;
		}

		public function get throwHeight():int {
			return throw_height$field;
		}

		/**
		 *  @private
		 */
		public static const THROW_WEIGHT_RATIO:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.SpellEffectProto.throw_weight_ratio", "throwWeightRatio", (67 << 3) | com.netease.protobuf.WireType.VARINT);

		private var throw_weight_ratio$field:int;

		public function clearThrowWeightRatio():void {
			hasField$1 &= 0xfffffbff;
			throw_weight_ratio$field = new int();
		}

		public function get hasThrowWeightRatio():Boolean {
			return (hasField$1 & 0x400) != 0;
		}

		public function set throwWeightRatio(value:int):void {
			hasField$1 |= 0x400;
			throw_weight_ratio$field = value;
		}

		public function get throwWeightRatio():int {
			return throw_weight_ratio$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, id$field);
			}
			if (hasAttackMotionId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, attack_motion_id$field);
			}
			if (hasAttackMotionSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, attack_motion_speed$field);
			}
			if (hasHurtDelay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hurt_delay$field);
			}
			if (hasCastTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cast_time$field);
			}
			if (hasDelayTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, delay_time$field);
			}
			if (hasCastAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, cast_animation$field);
			}
			if (hasSelfDestAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, self_dest_animation$field);
			}
			if (hasHurtAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hurt_animation$field);
			}
			if (hasDestAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dest_animation$field);
			}
			if (hasSputteringHurtAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 33);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, sputtering_hurt_animation$field);
			}
			if (hasFlyAnimation) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fly_animation$field);
			}
			if (hasFlySpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fly_speed$field);
			}
			if (hasFlyTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, fly_time$field);
			}
			if (hasIsFlyCross) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_fly_cross$field);
			}
			if (hasIsTrackTarget) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_track_target$field);
			}
			if (hasBlinkType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, blink_type$field);
			}
			if (hasBlinkSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, blink_speed$field);
			}
			if (hasBlinkHeight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, blink_height$field);
			}
			if (hasBeatBackSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 27);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, beat_back_speed$field);
			}
			if (hasCanWalkRelease) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 28);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, can_walk_release$field);
			}
			if (hasRepeatTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 29);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, repeat_times$field);
			}
			if (hasRepeatInterval) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 30);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, repeat_interval$field);
			}
			if (hasMaxHurtTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 31);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, max_hurt_times$field);
			}
			if (hasIsTrapSpell) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 32);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_trap_spell$field);
			}
			if (hasCaromStartFrameTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 50);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, carom_start_frame_time$field);
			}
			if (hasHitFrameTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 51);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, hit_frame_time$field);
			}
			if (hasBreakFrameTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 52);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, break_frame_time$field);
			}
			if (hasSoarFrameTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 53);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, soar_frame_time$field);
			}
			if (hasThrowDelayTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 54);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, throw_delay_time$field);
			}
			if (hasGhostEffect) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 55);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, ghost_effect$field);
			}
			if (hasMatchTerrain) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 56);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, match_terrain$field);
			}
			if (hasKeepSpacing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 57);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, keep_spacing$field);
			}
			if (hasDeadLaunchHeight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 58);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_launch_height$field);
			}
			if (hasDeadBeatDistance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 59);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_beat_distance$field);
			}
			if (hasDeadBeatSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 60);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_beat_speed$field);
			}
			if (hasDeadBeatProbability) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 61);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_beat_probability$field);
			}
			if (hasDeadLaunchProbability) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 62);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_launch_probability$field);
			}
			if (hasDeadLaunchDistance) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 63);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_launch_distance$field);
			}
			if (hasDeadLaunchSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 64);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, dead_launch_speed$field);
			}
			if (hasIsAdaptiveTargetHeight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 65);
				com.netease.protobuf.WriteUtils.write_TYPE_BOOL(output, is_adaptive_target_height$field);
			}
			if (hasThrowHeight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 66);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, throw_height$field);
			}
			if (hasThrowWeightRatio) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 67);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, throw_weight_ratio$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var attack_motion_id$count:uint = 0;
			var attack_motion_speed$count:uint = 0;
			var hurt_delay$count:uint = 0;
			var cast_time$count:uint = 0;
			var delay_time$count:uint = 0;
			var cast_animation$count:uint = 0;
			var self_dest_animation$count:uint = 0;
			var hurt_animation$count:uint = 0;
			var dest_animation$count:uint = 0;
			var sputtering_hurt_animation$count:uint = 0;
			var fly_animation$count:uint = 0;
			var fly_speed$count:uint = 0;
			var fly_time$count:uint = 0;
			var is_fly_cross$count:uint = 0;
			var is_track_target$count:uint = 0;
			var blink_type$count:uint = 0;
			var blink_speed$count:uint = 0;
			var blink_height$count:uint = 0;
			var beat_back_speed$count:uint = 0;
			var can_walk_release$count:uint = 0;
			var repeat_times$count:uint = 0;
			var repeat_interval$count:uint = 0;
			var max_hurt_times$count:uint = 0;
			var is_trap_spell$count:uint = 0;
			var carom_start_frame_time$count:uint = 0;
			var hit_frame_time$count:uint = 0;
			var break_frame_time$count:uint = 0;
			var soar_frame_time$count:uint = 0;
			var throw_delay_time$count:uint = 0;
			var ghost_effect$count:uint = 0;
			var match_terrain$count:uint = 0;
			var keep_spacing$count:uint = 0;
			var dead_launch_height$count:uint = 0;
			var dead_beat_distance$count:uint = 0;
			var dead_beat_speed$count:uint = 0;
			var dead_beat_probability$count:uint = 0;
			var dead_launch_probability$count:uint = 0;
			var dead_launch_distance$count:uint = 0;
			var dead_launch_speed$count:uint = 0;
			var is_adaptive_target_height$count:uint = 0;
			var throw_height$count:uint = 0;
			var throw_weight_ratio$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (attack_motion_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.attackMotionId cannot be set twice.');
					}
					++attack_motion_id$count;
					this.attackMotionId = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 6:
					if (attack_motion_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.attackMotionSpeed cannot be set twice.');
					}
					++attack_motion_speed$count;
					this.attackMotionSpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 10:
					if (hurt_delay$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.hurtDelay cannot be set twice.');
					}
					++hurt_delay$count;
					this.hurtDelay = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 11:
					if (cast_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.castTime cannot be set twice.');
					}
					++cast_time$count;
					this.castTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					if (delay_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.delayTime cannot be set twice.');
					}
					++delay_time$count;
					this.delayTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 15:
					if (cast_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.castAnimation cannot be set twice.');
					}
					++cast_animation$count;
					this.castAnimation = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 16:
					if (self_dest_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.selfDestAnimation cannot be set twice.');
					}
					++self_dest_animation$count;
					this.selfDestAnimation = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 17:
					if (hurt_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.hurtAnimation cannot be set twice.');
					}
					++hurt_animation$count;
					this.hurtAnimation = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 18:
					if (dest_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.destAnimation cannot be set twice.');
					}
					++dest_animation$count;
					this.destAnimation = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 33:
					if (sputtering_hurt_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.sputteringHurtAnimation cannot be set twice.');
					}
					++sputtering_hurt_animation$count;
					this.sputteringHurtAnimation = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 19:
					if (fly_animation$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.flyAnimation cannot be set twice.');
					}
					++fly_animation$count;
					this.flyAnimation = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 20:
					if (fly_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.flySpeed cannot be set twice.');
					}
					++fly_speed$count;
					this.flySpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 21:
					if (fly_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.flyTime cannot be set twice.');
					}
					++fly_time$count;
					this.flyTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 22:
					if (is_fly_cross$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.isFlyCross cannot be set twice.');
					}
					++is_fly_cross$count;
					this.isFlyCross = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 23:
					if (is_track_target$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.isTrackTarget cannot be set twice.');
					}
					++is_track_target$count;
					this.isTrackTarget = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 24:
					if (blink_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.blinkType cannot be set twice.');
					}
					++blink_type$count;
					this.blinkType = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 25:
					if (blink_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.blinkSpeed cannot be set twice.');
					}
					++blink_speed$count;
					this.blinkSpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 26:
					if (blink_height$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.blinkHeight cannot be set twice.');
					}
					++blink_height$count;
					this.blinkHeight = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 27:
					if (beat_back_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.beatBackSpeed cannot be set twice.');
					}
					++beat_back_speed$count;
					this.beatBackSpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 28:
					if (can_walk_release$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.canWalkRelease cannot be set twice.');
					}
					++can_walk_release$count;
					this.canWalkRelease = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 29:
					if (repeat_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.repeatTimes cannot be set twice.');
					}
					++repeat_times$count;
					this.repeatTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 30:
					if (repeat_interval$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.repeatInterval cannot be set twice.');
					}
					++repeat_interval$count;
					this.repeatInterval = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 31:
					if (max_hurt_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.maxHurtTimes cannot be set twice.');
					}
					++max_hurt_times$count;
					this.maxHurtTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 32:
					if (is_trap_spell$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.isTrapSpell cannot be set twice.');
					}
					++is_trap_spell$count;
					this.isTrapSpell = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 50:
					if (carom_start_frame_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.caromStartFrameTime cannot be set twice.');
					}
					++carom_start_frame_time$count;
					this.caromStartFrameTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 51:
					if (hit_frame_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.hitFrameTime cannot be set twice.');
					}
					++hit_frame_time$count;
					this.hitFrameTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 52:
					if (break_frame_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.breakFrameTime cannot be set twice.');
					}
					++break_frame_time$count;
					this.breakFrameTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 53:
					if (soar_frame_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.soarFrameTime cannot be set twice.');
					}
					++soar_frame_time$count;
					this.soarFrameTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 54:
					if (throw_delay_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.throwDelayTime cannot be set twice.');
					}
					++throw_delay_time$count;
					this.throwDelayTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 55:
					if (ghost_effect$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.ghostEffect cannot be set twice.');
					}
					++ghost_effect$count;
					this.ghostEffect = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 56:
					if (match_terrain$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.matchTerrain cannot be set twice.');
					}
					++match_terrain$count;
					this.matchTerrain = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 57:
					if (keep_spacing$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.keepSpacing cannot be set twice.');
					}
					++keep_spacing$count;
					this.keepSpacing = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 58:
					if (dead_launch_height$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadLaunchHeight cannot be set twice.');
					}
					++dead_launch_height$count;
					this.deadLaunchHeight = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 59:
					if (dead_beat_distance$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadBeatDistance cannot be set twice.');
					}
					++dead_beat_distance$count;
					this.deadBeatDistance = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 60:
					if (dead_beat_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadBeatSpeed cannot be set twice.');
					}
					++dead_beat_speed$count;
					this.deadBeatSpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 61:
					if (dead_beat_probability$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadBeatProbability cannot be set twice.');
					}
					++dead_beat_probability$count;
					this.deadBeatProbability = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 62:
					if (dead_launch_probability$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadLaunchProbability cannot be set twice.');
					}
					++dead_launch_probability$count;
					this.deadLaunchProbability = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 63:
					if (dead_launch_distance$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadLaunchDistance cannot be set twice.');
					}
					++dead_launch_distance$count;
					this.deadLaunchDistance = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 64:
					if (dead_launch_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.deadLaunchSpeed cannot be set twice.');
					}
					++dead_launch_speed$count;
					this.deadLaunchSpeed = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 65:
					if (is_adaptive_target_height$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.isAdaptiveTargetHeight cannot be set twice.');
					}
					++is_adaptive_target_height$count;
					this.isAdaptiveTargetHeight = com.netease.protobuf.ReadUtils.read_TYPE_BOOL(input);
					break;
				case 66:
					if (throw_height$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.throwHeight cannot be set twice.');
					}
					++throw_height$count;
					this.throwHeight = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 67:
					if (throw_weight_ratio$count != 0) {
						throw new flash.errors.IOError('Bad data format: SpellEffectProto.throwWeightRatio cannot be set twice.');
					}
					++throw_weight_ratio$count;
					this.throwWeightRatio = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
