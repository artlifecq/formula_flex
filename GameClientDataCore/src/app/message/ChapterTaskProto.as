package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	import app.message.TaskProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChapterTaskProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHAPTER:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChapterTaskProto.chapter", "chapter", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chapter$field:int;

		private var hasField$0:uint = 0;

		public function clearChapter():void {
			hasField$0 &= 0xfffffffe;
			chapter$field = new int();
		}

		public function get hasChapter():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chapter(value:int):void {
			hasField$0 |= 0x1;
			chapter$field = value;
		}

		public function get chapter():int {
			return chapter$field;
		}

		/**
		 *  @private
		 */
		public static const COMPLETED_TASK:RepeatedFieldDescriptor_TYPE_BYTES = new RepeatedFieldDescriptor_TYPE_BYTES("app.message.ChapterTaskProto.completed_task", "completedTask", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		[ArrayElementType("flash.utils.ByteArray")]
		public var completedTask:Array = [];

		/**
		 *  @private
		 */
		public static const BASE_TASK:FieldDescriptor_TYPE_MESSAGE = new FieldDescriptor_TYPE_MESSAGE("app.message.ChapterTaskProto.base_task", "baseTask", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.TaskProto; });

		private var base_task$field:app.message.TaskProto;

		public function clearBaseTask():void {
			base_task$field = null;
		}

		public function get hasBaseTask():Boolean {
			return base_task$field != null;
		}

		public function set baseTask(value:app.message.TaskProto):void {
			base_task$field = value;
		}

		public function get baseTask():app.message.TaskProto {
			return base_task$field;
		}

		/**
		 *  @private
		 */
		public static const COMPLTE_CHAPTER_COUNT:FieldDescriptor_TYPE_INT32 = new FieldDescriptor_TYPE_INT32("app.message.ChapterTaskProto.complte_chapter_count", "complteChapterCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var complte_chapter_count$field:int;

		public function clearComplteChapterCount():void {
			hasField$0 &= 0xfffffffd;
			complte_chapter_count$field = new int();
		}

		public function get hasComplteChapterCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set complteChapterCount(value:int):void {
			hasField$0 |= 0x2;
			complte_chapter_count$field = value;
		}

		public function get complteChapterCount():int {
			return complte_chapter_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChapter) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, chapter$field);
			}
			for (var completedTask$index:uint = 0; completedTask$index < this.completedTask.length; ++completedTask$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write_TYPE_BYTES(output, this.completedTask[completedTask$index]);
			}
			if (hasBaseTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write_TYPE_MESSAGE(output, base_task$field);
			}
			if (hasComplteChapterCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write_TYPE_INT32(output, complte_chapter_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chapter$count:uint = 0;
			var base_task$count:uint = 0;
			var complte_chapter_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read_TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chapter$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskProto.chapter cannot be set twice.');
					}
					++chapter$count;
					this.chapter = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				case 2:
					this.completedTask.push(com.netease.protobuf.ReadUtils.read_TYPE_BYTES(input));
					break;
				case 3:
					if (base_task$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskProto.baseTask cannot be set twice.');
					}
					++base_task$count;
					this.baseTask = new app.message.TaskProto();
					com.netease.protobuf.ReadUtils.read_TYPE_MESSAGE(input, this.baseTask);
					break;
				case 4:
					if (complte_chapter_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskProto.complteChapterCount cannot be set twice.');
					}
					++complte_chapter_count$count;
					this.complteChapterCount = com.netease.protobuf.ReadUtils.read_TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
