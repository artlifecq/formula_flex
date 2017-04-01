package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.ExtraPrize;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ExamConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const WAIT_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.wait_time", "waitTime", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var wait_time$field:int;

		private var hasField$0:uint = 0;

		public function clearWaitTime():void {
			hasField$0 &= 0xfffffffe;
			wait_time$field = new int();
		}

		public function get hasWaitTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set waitTime(value:int):void {
			hasField$0 |= 0x1;
			wait_time$field = value;
		}

		public function get waitTime():int {
			return wait_time$field;
		}

		/**
		 *  @private
		 */
		public static const ANSWER_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.answer_time", "answerTime", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var answer_time$field:int;

		public function clearAnswerTime():void {
			hasField$0 &= 0xfffffffd;
			answer_time$field = new int();
		}

		public function get hasAnswerTime():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set answerTime(value:int):void {
			hasField$0 |= 0x2;
			answer_time$field = value;
		}

		public function get answerTime():int {
			return answer_time$field;
		}

		/**
		 *  @private
		 */
		public static const SHOW_ANSWER_TIME:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.show_answer_time", "showAnswerTime", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var show_answer_time$field:int;

		public function clearShowAnswerTime():void {
			hasField$0 &= 0xfffffffb;
			show_answer_time$field = new int();
		}

		public function get hasShowAnswerTime():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set showAnswerTime(value:int):void {
			hasField$0 |= 0x4;
			show_answer_time$field = value;
		}

		public function get showAnswerTime():int {
			return show_answer_time$field;
		}

		/**
		 *  @private
		 */
		public static const QUESTION_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.question_count", "questionCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var question_count$field:int;

		public function clearQuestionCount():void {
			hasField$0 &= 0xfffffff7;
			question_count$field = new int();
		}

		public function get hasQuestionCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set questionCount(value:int):void {
			hasField$0 |= 0x8;
			question_count$field = value;
		}

		public function get questionCount():int {
			return question_count$field;
		}

		/**
		 *  @private
		 */
		public static const DOUBLE_SCORE_MAX_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.double_score_max_times", "doubleScoreMaxTimes", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var double_score_max_times$field:int;

		public function clearDoubleScoreMaxTimes():void {
			hasField$0 &= 0xffffffef;
			double_score_max_times$field = new int();
		}

		public function get hasDoubleScoreMaxTimes():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set doubleScoreMaxTimes(value:int):void {
			hasField$0 |= 0x10;
			double_score_max_times$field = value;
		}

		public function get doubleScoreMaxTimes():int {
			return double_score_max_times$field;
		}

		/**
		 *  @private
		 */
		public static const REMOVE_WRONG_ANSWER_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.remove_wrong_answer_times", "removeWrongAnswerTimes", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var remove_wrong_answer_times$field:int;

		public function clearRemoveWrongAnswerTimes():void {
			hasField$0 &= 0xffffffdf;
			remove_wrong_answer_times$field = new int();
		}

		public function get hasRemoveWrongAnswerTimes():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set removeWrongAnswerTimes(value:int):void {
			hasField$0 |= 0x20;
			remove_wrong_answer_times$field = value;
		}

		public function get removeWrongAnswerTimes():int {
			return remove_wrong_answer_times$field;
		}

		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor_TYPE_STRING = new FieldDescriptor_TYPE_STRING("app.message.ExamConfig.start_time", "startTime", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var start_time$field:String;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:String):void {
			start_time$field = value;
		}

		public function get startTime():String {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const FOLLOW_MAX_TIMES:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ExamConfig.follow_max_times", "followMaxTimes", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var follow_max_times$field:int;

		public function clearFollowMaxTimes():void {
			hasField$0 &= 0xffffffbf;
			follow_max_times$field = new int();
		}

		public function get hasFollowMaxTimes():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set followMaxTimes(value:int):void {
			hasField$0 |= 0x40;
			follow_max_times$field = value;
		}

		public function get followMaxTimes():int {
			return follow_max_times$field;
		}

		/**
		 *  @private
		 */
		public static const EXTRA_PERCENT:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ExamConfig.extra_percent", "extraPercent", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ExtraPrize; });

		[ArrayElementType("app.message.ExtraPrize")]
		public var extraPercent:Array = [];

		/**
		 *  @private
		 */
		public static const EXTRA_PRIZE:RepeatedFieldDescriptor_TYPE_MESSAGE = new RepeatedFieldDescriptor_TYPE_MESSAGE("app.message.ExamConfig.extra_prize", "extraPrize", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.ExtraPrize; });

		[ArrayElementType("app.message.ExtraPrize")]
		public var extraPrize:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasWaitTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, wait_time$field);
			}
			if (hasAnswerTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, answer_time$field);
			}
			if (hasShowAnswerTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, show_answer_time$field);
			}
			if (hasQuestionCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, question_count$field);
			}
			if (hasDoubleScoreMaxTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, double_score_max_times$field);
			}
			if (hasRemoveWrongAnswerTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, remove_wrong_answer_times$field);
			}
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write_TYPE_STRING(output, start_time$field);
			}
			if (hasFollowMaxTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, follow_max_times$field);
			}
			for (var extraPercent$index:uint = 0; extraPercent$index < this.extraPercent.length; ++extraPercent$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.extraPercent[extraPercent$index]);
			}
			for (var extraPrize$index:uint = 0; extraPrize$index < this.extraPrize.length; ++extraPrize$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, this.extraPrize[extraPrize$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var wait_time$count:uint = 0;
			var answer_time$count:uint = 0;
			var show_answer_time$count:uint = 0;
			var question_count$count:uint = 0;
			var double_score_max_times$count:uint = 0;
			var remove_wrong_answer_times$count:uint = 0;
			var start_time$count:uint = 0;
			var follow_max_times$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 2:
					if (wait_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.waitTime cannot be set twice.');
					}
					++wait_time$count;
					this.waitTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 3:
					if (answer_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.answerTime cannot be set twice.');
					}
					++answer_time$count;
					this.answerTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 4:
					if (show_answer_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.showAnswerTime cannot be set twice.');
					}
					++show_answer_time$count;
					this.showAnswerTime = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 5:
					if (question_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.questionCount cannot be set twice.');
					}
					++question_count$count;
					this.questionCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 7:
					if (double_score_max_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.doubleScoreMaxTimes cannot be set twice.');
					}
					++double_score_max_times$count;
					this.doubleScoreMaxTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 8:
					if (remove_wrong_answer_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.removeWrongAnswerTimes cannot be set twice.');
					}
					++remove_wrong_answer_times$count;
					this.removeWrongAnswerTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 9:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read_TYPE_STRING(input);
					break;
				case 11:
					if (follow_max_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamConfig.followMaxTimes cannot be set twice.');
					}
					++follow_max_times$count;
					this.followMaxTimes = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 12:
					this.extraPercent.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.ExtraPrize()));
					break;
				case 13:
					this.extraPrize.push(com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, new app.message.ExtraPrize()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
