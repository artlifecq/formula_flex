package app.message {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import app.message.FamilyMiscProto;
	import app.message.AllFamilyAnimalBarDatasProto;
	import app.message.AllFamilyHallDatasProto;
	import app.message.AllFamilyOfficerDatasProto;
	import app.message.AllFamilyCollageDatasProto;
	import app.message.AllFamilyBiaoDatasProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class FamilyConfig extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FAMILY_MISC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyConfig.family_misc", "familyMisc", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.FamilyMiscProto; });

		private var family_misc$field:app.message.FamilyMiscProto;

		public function clearFamilyMisc():void {
			family_misc$field = null;
		}

		public function get hasFamilyMisc():Boolean {
			return family_misc$field != null;
		}

		public function set familyMisc(value:app.message.FamilyMiscProto):void {
			family_misc$field = value;
		}

		public function get familyMisc():app.message.FamilyMiscProto {
			return family_misc$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_HALL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyConfig.family_hall", "familyHall", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyHallDatasProto; });

		private var family_hall$field:app.message.AllFamilyHallDatasProto;

		public function clearFamilyHall():void {
			family_hall$field = null;
		}

		public function get hasFamilyHall():Boolean {
			return family_hall$field != null;
		}

		public function set familyHall(value:app.message.AllFamilyHallDatasProto):void {
			family_hall$field = value;
		}

		public function get familyHall():app.message.AllFamilyHallDatasProto {
			return family_hall$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_COLLAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyConfig.family_collage", "familyCollage", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyCollageDatasProto; });

		private var family_collage$field:app.message.AllFamilyCollageDatasProto;

		public function clearFamilyCollage():void {
			family_collage$field = null;
		}

		public function get hasFamilyCollage():Boolean {
			return family_collage$field != null;
		}

		public function set familyCollage(value:app.message.AllFamilyCollageDatasProto):void {
			family_collage$field = value;
		}

		public function get familyCollage():app.message.AllFamilyCollageDatasProto {
			return family_collage$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_BIAO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyConfig.family_biao", "familyBiao", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyBiaoDatasProto; });

		private var family_biao$field:app.message.AllFamilyBiaoDatasProto;

		public function clearFamilyBiao():void {
			family_biao$field = null;
		}

		public function get hasFamilyBiao():Boolean {
			return family_biao$field != null;
		}

		public function set familyBiao(value:app.message.AllFamilyBiaoDatasProto):void {
			family_biao$field = value;
		}

		public function get familyBiao():app.message.AllFamilyBiaoDatasProto {
			return family_biao$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_ANIMAL_BAR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyConfig.family_animal_bar", "familyAnimalBar", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyAnimalBarDatasProto; });

		private var family_animal_bar$field:app.message.AllFamilyAnimalBarDatasProto;

		public function clearFamilyAnimalBar():void {
			family_animal_bar$field = null;
		}

		public function get hasFamilyAnimalBar():Boolean {
			return family_animal_bar$field != null;
		}

		public function set familyAnimalBar(value:app.message.AllFamilyAnimalBarDatasProto):void {
			family_animal_bar$field = value;
		}

		public function get familyAnimalBar():app.message.AllFamilyAnimalBarDatasProto {
			return family_animal_bar$field;
		}

		/**
		 *  @private
		 */
		public static const FAMILY_OFFICERS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("app.message.FamilyConfig.family_officers", "familyOfficers", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return app.message.AllFamilyOfficerDatasProto; });

		private var family_officers$field:app.message.AllFamilyOfficerDatasProto;

		public function clearFamilyOfficers():void {
			family_officers$field = null;
		}

		public function get hasFamilyOfficers():Boolean {
			return family_officers$field != null;
		}

		public function set familyOfficers(value:app.message.AllFamilyOfficerDatasProto):void {
			family_officers$field = value;
		}

		public function get familyOfficers():app.message.AllFamilyOfficerDatasProto {
			return family_officers$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFamilyMisc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_misc$field);
			}
			if (hasFamilyHall) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_hall$field);
			}
			if (hasFamilyCollage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_collage$field);
			}
			if (hasFamilyBiao) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_biao$field);
			}
			if (hasFamilyAnimalBar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_animal_bar$field);
			}
			if (hasFamilyOfficers) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, family_officers$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var family_misc$count:uint = 0;
			var family_hall$count:uint = 0;
			var family_collage$count:uint = 0;
			var family_biao$count:uint = 0;
			var family_animal_bar$count:uint = 0;
			var family_officers$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (family_misc$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyConfig.familyMisc cannot be set twice.');
					}
					++family_misc$count;
					this.familyMisc = new app.message.FamilyMiscProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyMisc);
					break;
				case 2:
					if (family_hall$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyConfig.familyHall cannot be set twice.');
					}
					++family_hall$count;
					this.familyHall = new app.message.AllFamilyHallDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyHall);
					break;
				case 3:
					if (family_collage$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyConfig.familyCollage cannot be set twice.');
					}
					++family_collage$count;
					this.familyCollage = new app.message.AllFamilyCollageDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyCollage);
					break;
				case 4:
					if (family_biao$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyConfig.familyBiao cannot be set twice.');
					}
					++family_biao$count;
					this.familyBiao = new app.message.AllFamilyBiaoDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyBiao);
					break;
				case 5:
					if (family_animal_bar$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyConfig.familyAnimalBar cannot be set twice.');
					}
					++family_animal_bar$count;
					this.familyAnimalBar = new app.message.AllFamilyAnimalBarDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyAnimalBar);
					break;
				case 6:
					if (family_officers$count != 0) {
						throw new flash.errors.IOError('Bad data format: FamilyConfig.familyOfficers cannot be set twice.');
					}
					++family_officers$count;
					this.familyOfficers = new app.message.AllFamilyOfficerDatasProto();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.familyOfficers);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
