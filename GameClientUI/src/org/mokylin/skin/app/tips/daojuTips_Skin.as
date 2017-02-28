package org.mokylin.skin.app.tips
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class daojuTips_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var grp_icon:feathers.controls.Group;

		public var lbl_lengque:feathers.controls.Label;

		public var lbl_lijin:feathers.controls.Label;

		public var lbl_lock:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var lbl_shuomingName:feathers.controls.Label;

		public var lbl_t1:feathers.controls.Label;

		public var lbl_t2:feathers.controls.Label;

		public var lbl_t3:feathers.controls.Label;

		public var lbl_time_shixiao:feathers.controls.Label;

		public var lbl_time_type:feathers.controls.Label;

		public var lbl_yinzi:feathers.controls.Label;

		public var lock:feathers.controls.UIAsset;

		public var yingzi:feathers.controls.UIAsset;

		public var yuanbao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function daojuTips_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 526;
			this.width = 298;
			this.elementsContent = [bg_i(),grp_icon_i(),lbl_name_i(),lbl_lock_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __daojuTips_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/64.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 526;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 8;
			temp.y = 10;
			temp.elementsContent = [__daojuTips_Skin_UIAsset1_i(),lock_i()];
			return temp;
		}

		private function lbl_lock_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lock = temp;
			temp.name = "lbl_lock";
			temp.text = "【已绑定】";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 84;
			temp.y = 38;
			return temp;
		}

		private function lbl_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_name = temp;
			temp.name = "lbl_name";
			temp.bold = true;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "道具类tips";
			temp.textAlign = "left";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 196;
			temp.x = 86;
			temp.y = 13;
			return temp;
		}

		private function lock_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lock = temp;
			temp.name = "lock";
			temp.styleName = "ui/common/tubiao/suo.png";
			temp.x = 10;
			temp.y = 51;
			return temp;
		}

	}
}