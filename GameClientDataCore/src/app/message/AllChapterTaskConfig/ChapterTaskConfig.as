package app.message.AllChapterTaskConfig {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import flash.utils.ByteArray;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ChapterTaskConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHAPTER_NAME:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.AllChapterTaskConfig.ChapterTaskConfig.chapter_name", "chapterName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chapter_name$field:flash.utils.ByteArray;

		public function clearChapterName():void {
			chapter_name$field = null;
		}

		public function get hasChapterName():Boolean {
			return chapter_name$field != null;
		}

		public function set chapterName(value:flash.utils.ByteArray):void {
			chapter_name$field = value;
		}

		public function get chapterName():flash.utils.ByteArray {
			return chapter_name$field;
		}

		/**
		 *  @private
		 */
		public static const CHAPTER_ICON:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.AllChapterTaskConfig.ChapterTaskConfig.chapter_icon", "chapterIcon", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chapter_icon$field:flash.utils.ByteArray;

		public function clearChapterIcon():void {
			chapter_icon$field = null;
		}

		public function get hasChapterIcon():Boolean {
			return chapter_icon$field != null;
		}

		public function set chapterIcon(value:flash.utils.ByteArray):void {
			chapter_icon$field = value;
		}

		public function get chapterIcon():flash.utils.ByteArray {
			return chapter_icon$field;
		}

		/**
		 *  @private
		 */
		public static const CHAPTER_TITLE:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.AllChapterTaskConfig.ChapterTaskConfig.chapter_title", "chapterTitle", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chapter_title$field:flash.utils.ByteArray;

		public function clearChapterTitle():void {
			chapter_title$field = null;
		}

		public function get hasChapterTitle():Boolean {
			return chapter_title$field != null;
		}

		public function set chapterTitle(value:flash.utils.ByteArray):void {
			chapter_title$field = value;
		}

		public function get chapterTitle():flash.utils.ByteArray {
			return chapter_title$field;
		}

		/**
		 *  @private
		 */
		public static const CHAPTER_DESC:FieldDescriptor$TYPE_BYTES = new FieldDescriptor$TYPE_BYTES("app.message.AllChapterTaskConfig.ChapterTaskConfig.chapter_desc", "chapterDesc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chapter_desc$field:flash.utils.ByteArray;

		public function clearChapterDesc():void {
			chapter_desc$field = null;
		}

		public function get hasChapterDesc():Boolean {
			return chapter_desc$field != null;
		}

		public function set chapterDesc(value:flash.utils.ByteArray):void {
			chapter_desc$field = value;
		}

		public function get chapterDesc():flash.utils.ByteArray {
			return chapter_desc$field;
		}

		/**
		 *  @private
		 */
		public static const CHAPTER_TASK_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("app.message.AllChapterTaskConfig.ChapterTaskConfig.chapter_task_count", "chapterTaskCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chapter_task_count$field:int;

		private var hasField$0:uint = 0;

		public function clearChapterTaskCount():void {
			hasField$0 &= 0xfffffffe;
			chapter_task_count$field = new int();
		}

		public function get hasChapterTaskCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chapterTaskCount(value:int):void {
			hasField$0 |= 0x1;
			chapter_task_count$field = value;
		}

		public function get chapterTaskCount():int {
			return chapter_task_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChapterName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, chapter_name$field);
			}
			if (hasChapterIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, chapter_icon$field);
			}
			if (hasChapterTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, chapter_title$field);
			}
			if (hasChapterDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_BYTES(output, chapter_desc$field);
			}
			if (hasChapterTaskCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chapter_task_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chapter_name$count:uint = 0;
			var chapter_icon$count:uint = 0;
			var chapter_title$count:uint = 0;
			var chapter_desc$count:uint = 0;
			var chapter_task_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chapter_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskConfig.chapterName cannot be set twice.');
					}
					++chapter_name$count;
					this.chapterName = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 2:
					if (chapter_icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskConfig.chapterIcon cannot be set twice.');
					}
					++chapter_icon$count;
					this.chapterIcon = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 3:
					if (chapter_title$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskConfig.chapterTitle cannot be set twice.');
					}
					++chapter_title$count;
					this.chapterTitle = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 4:
					if (chapter_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskConfig.chapterDesc cannot be set twice.');
					}
					++chapter_desc$count;
					this.chapterDesc = com.netease.protobuf.ReadUtils.read$TYPE_BYTES(input);
					break;
				case 5:
					if (chapter_task_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChapterTaskConfig.chapterTaskCount cannot be set twice.');
					}
					++chapter_task_count$count;
					this.chapterTaskCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
