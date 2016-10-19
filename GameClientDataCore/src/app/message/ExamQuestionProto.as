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
	public dynamic final class ExamQuestionProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ExamQuestionProto.index", "index", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var index$field:int;

		private var hasField$0:uint = 0;

		public function clearIndex():void {
			hasField$0 &= 0xfffffffe;
			index$field = new int();
		}

		public function get hasIndex():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set index(value:int):void {
			hasField$0 |= 0x1;
			index$field = value;
		}

		public function get index():int {
			return index$field;
		}

		/**
		 *  @private
		 */
		public static const QUESTION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.ExamQuestionProto.question", "question", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var question$field:String;

		public function clearQuestion():void {
			question$field = null;
		}

		public function get hasQuestion():Boolean {
			return question$field != null;
		}

		public function set question(value:String):void {
			question$field = value;
		}

		public function get question():String {
			return question$field;
		}

		/**
		 *  @private
		 */
		public static const CORRECT_ANSWER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("app.message.ExamQuestionProto.correct_answer", "correctAnswer", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var correct_answer$field:String;

		public function clearCorrectAnswer():void {
			correct_answer$field = null;
		}

		public function get hasCorrectAnswer():Boolean {
			return correct_answer$field != null;
		}

		public function set correctAnswer(value:String):void {
			correct_answer$field = value;
		}

		public function get correctAnswer():String {
			return correct_answer$field;
		}

		/**
		 *  @private
		 */
		public static const WRONG_ANSWERS:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("app.message.ExamQuestionProto.wrong_answers", "wrongAnswers", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var wrongAnswers:Array = [];

		/**
		 *  @private
		 */
		public static const CORRECT_ANSWER_INDEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.ExamQuestionProto.correct_answer_index", "correctAnswerIndex", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var correct_answer_index$field:int;

		public function clearCorrectAnswerIndex():void {
			hasField$0 &= 0xfffffffd;
			correct_answer_index$field = new int();
		}

		public function get hasCorrectAnswerIndex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set correctAnswerIndex(value:int):void {
			hasField$0 |= 0x2;
			correct_answer_index$field = value;
		}

		public function get correctAnswerIndex():int {
			return correct_answer_index$field;
		}

		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("app.message.ExamQuestionProto.start_time", "startTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var start_time$field:Int64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:Int64):void {
			start_time$field = value;
		}

		public function get startTime():Int64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const TOP_HERO_ID:RepeatedFieldDescriptor$TYPE_INT64 = new RepeatedFieldDescriptor$TYPE_INT64("app.message.ExamQuestionProto.top_hero_id", "topHeroId", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("Int64")]
		public var topHeroId:Array = [];

		/**
		 *  @private
		 */
		public static const TOP_HERO_NAME:RepeatedFieldDescriptor$TYPE_STRING = new RepeatedFieldDescriptor$TYPE_STRING("app.message.ExamQuestionProto.top_hero_name", "topHeroName", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("String")]
		public var topHeroName:Array = [];

		/**
		 *  @private
		 */
		public static const TOP_HERO_SCORE:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.ExamQuestionProto.top_hero_score", "topHeroScore", (23 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var topHeroScore:Array = [];

		/**
		 *  @private
		 */
		public static const COUNTRY:RepeatedFieldDescriptor$TYPE_INT32 = new RepeatedFieldDescriptor$TYPE_INT32("app.message.ExamQuestionProto.country", "country", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		[ArrayElementType("int")]
		public var country:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, index$field);
			}
			if (hasQuestion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, question$field);
			}
			if (hasCorrectAnswer) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, correct_answer$field);
			}
			for (var wrongAnswers$index:uint = 0; wrongAnswers$index < this.wrongAnswers.length; ++wrongAnswers$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.wrongAnswers[wrongAnswers$index]);
			}
			if (hasCorrectAnswerIndex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, correct_answer_index$field);
			}
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, start_time$field);
			}
			for (var topHeroId$index:uint = 0; topHeroId$index < this.topHeroId.length; ++topHeroId$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, this.topHeroId[topHeroId$index]);
			}
			for (var topHeroName$index:uint = 0; topHeroName$index < this.topHeroName.length; ++topHeroName$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.topHeroName[topHeroName$index]);
			}
			for (var topHeroScore$index:uint = 0; topHeroScore$index < this.topHeroScore.length; ++topHeroScore$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.topHeroScore[topHeroScore$index]);
			}
			for (var country$index:uint = 0; country$index < this.country.length; ++country$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.country[country$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var index$count:uint = 0;
			var question$count:uint = 0;
			var correct_answer$count:uint = 0;
			var correct_answer_index$count:uint = 0;
			var start_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (index$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamQuestionProto.index cannot be set twice.');
					}
					++index$count;
					this.index = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (question$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamQuestionProto.question cannot be set twice.');
					}
					++question$count;
					this.question = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (correct_answer$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamQuestionProto.correctAnswer cannot be set twice.');
					}
					++correct_answer$count;
					this.correctAnswer = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					this.wrongAnswers.push(com.netease.protobuf.ReadUtils.read$TYPE_STRING(input));
					break;
				case 5:
					if (correct_answer_index$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamQuestionProto.correctAnswerIndex cannot be set twice.');
					}
					++correct_answer_index$count;
					this.correctAnswerIndex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExamQuestionProto.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 21:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT64, this.topHeroId);
						break;
					}
					this.topHeroId.push(com.netease.protobuf.ReadUtils.read$TYPE_INT64(input));
					break;
				case 22:
					this.topHeroName.push(com.netease.protobuf.ReadUtils.read$TYPE_STRING(input));
					break;
				case 23:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.topHeroScore);
						break;
					}
					this.topHeroScore.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				case 24:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_INT32, this.country);
						break;
					}
					this.country.push(com.netease.protobuf.ReadUtils.read$TYPE_INT32(input));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
