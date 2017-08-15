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
	public class Tips_DaoJu1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var bg:feathers.controls.Group;

		public var bg_bai:feathers.controls.UIAsset;

		public var bg_di:feathers.controls.UIAsset;

		public var bg_hong:feathers.controls.UIAsset;

		public var bg_huang:feathers.controls.UIAsset;

		public var bg_lan:feathers.controls.UIAsset;

		public var bg_lv:feathers.controls.UIAsset;

		public var bg_zi:feathers.controls.UIAsset;

		public var imgLine1:feathers.controls.UIAsset;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var lb3:feathers.controls.Label;

		public var lb4:feathers.controls.Label;

		public var lbBangding:feathers.controls.Label;

		public var lbCishu:feathers.controls.Label;

		public var lbDengji:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbXiaohao:feathers.controls.Label;

		public var lbXiuwei:feathers.controls.Label;

		public var suo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_DaoJu1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 264;
			this.width = 280;
			this.elementsContent = [bg_di_i(),bg_i(),imgLine1_i(),Icon_i(),suo_i(),lbName_i(),lb1_i(),lb2_i(),lb3_i(),lbDengji_i(),lbXiaohao_i(),lbXiuwei_i(),lb4_i(),lbCishu_i(),lbBangding_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 12;
			temp.y = 39;
			return temp;
		}

		private function bg_bai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_bai = temp;
			temp.name = "bg_bai";
			temp.height = 238;
			temp.styleName = "ui/common/tips/zhuangbei/bg_bai.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_di_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_di = temp;
			temp.name = "bg_di";
			temp.styleName = "ui/common/tips/zhuangbei/bg_buttom1.png";
			temp.x = 0;
			temp.y = 238;
			return temp;
		}

		private function bg_hong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_hong = temp;
			temp.name = "bg_hong";
			temp.height = 238;
			temp.styleName = "ui/common/tips/zhuangbei/bg_hong.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_huang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_huang = temp;
			temp.name = "bg_huang";
			temp.height = 238;
			temp.styleName = "ui/common/tips/zhuangbei/bg_jin.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bg = temp;
			temp.name = "bg";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [bg_bai_i(),bg_lv_i(),bg_lan_i(),bg_zi_i(),bg_huang_i(),bg_hong_i()];
			return temp;
		}

		private function bg_lan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lan = temp;
			temp.name = "bg_lan";
			temp.height = 238;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lan.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_lv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_lv = temp;
			temp.name = "bg_lv";
			temp.height = 238;
			temp.styleName = "ui/common/tips/zhuangbei/bg_lv.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_zi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_zi = temp;
			temp.name = "bg_zi";
			temp.height = 238;
			temp.styleName = "ui/common/tips/zhuangbei/bg_zi.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLine1 = temp;
			temp.name = "imgLine1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 147;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.text = "等级要求：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 96;
			temp.y = 48;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.text = "消    耗：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 96;
			temp.y = 67;
			return temp;
		}

		private function lb3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb3 = temp;
			temp.name = "lb3";
			temp.text = "今日修为上线：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 97;
			temp.y = 87;
			return temp;
		}

		private function lb4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb4 = temp;
			temp.name = "lb4";
			temp.text = "今日使用次数：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 120;
			return temp;
		}

		private function lbBangding_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBangding = temp;
			temp.name = "lbBangding";
			temp.height = 18;
			temp.text = "【已绑定】";
			temp.color = 0x00FF0C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 76;
			temp.x = 201;
			temp.y = 235;
			return temp;
		}

		private function lbCishu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCishu = temp;
			temp.name = "lbCishu";
			temp.text = "3/3";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 55;
			temp.x = 108;
			temp.y = 120;
			return temp;
		}

		private function lbDengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDengji = temp;
			temp.name = "lbDengji";
			temp.text = "85";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 168;
			temp.y = 48;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "秘制修为丹";
			temp.textAlign = "center";
			temp.color = 0xEEEEEE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 10;
			temp.y = 11;
			return temp;
		}

		private function lbXiaohao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaohao = temp;
			temp.name = "lbXiaohao";
			temp.text = "无";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 167;
			temp.y = 67;
			return temp;
		}

		private function lbXiuwei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiuwei = temp;
			temp.name = "lbXiuwei";
			temp.text = "无";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 195;
			temp.y = 87;
			return temp;
		}

		private function suo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			suo = temp;
			temp.name = "suo";
			temp.styleName = "ui/common/tubiao/suo_da.png";
			temp.x = 67;
			temp.y = 91;
			return temp;
		}

	}
}