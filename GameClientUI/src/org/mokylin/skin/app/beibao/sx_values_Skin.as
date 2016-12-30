package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.progress.progress_role1_Skin;
	import org.mokylin.skin.component.progress.progress_role2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class sx_values_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbl_jy:feathers.controls.Label;

		public var lbl_t0:feathers.controls.Label;

		public var lbl_t1:feathers.controls.Label;

		public var lbl_t10:feathers.controls.Label;

		public var lbl_t11:feathers.controls.Label;

		public var lbl_t12:feathers.controls.Label;

		public var lbl_t13:feathers.controls.Label;

		public var lbl_t14:feathers.controls.Label;

		public var lbl_t15:feathers.controls.Label;

		public var lbl_t2:feathers.controls.Label;

		public var lbl_t3:feathers.controls.Label;

		public var lbl_t4:feathers.controls.Label;

		public var lbl_t5:feathers.controls.Label;

		public var lbl_t6:feathers.controls.Label;

		public var lbl_t7:feathers.controls.Label;

		public var lbl_t8:feathers.controls.Label;

		public var lbl_t9:feathers.controls.Label;

		public var lbl_zq:feathers.controls.Label;

		public var pro_jinyan:feathers.controls.ProgressBar;

		public var pro_zhenqi:feathers.controls.ProgressBar;

		public var txt:feathers.controls.Group;

		public var txt_cur:feathers.controls.Label;

		public var txt_jinyan:feathers.controls.Label;

		public var txt_t0:feathers.controls.Label;

		public var txt_t1:feathers.controls.Label;

		public var txt_t10:feathers.controls.Label;

		public var txt_t11:feathers.controls.Label;

		public var txt_t12:feathers.controls.Label;

		public var txt_t13:feathers.controls.Label;

		public var txt_t14:feathers.controls.Label;

		public var txt_t15:feathers.controls.Label;

		public var txt_t2:feathers.controls.Label;

		public var txt_t3:feathers.controls.Label;

		public var txt_t4:feathers.controls.Label;

		public var txt_t5:feathers.controls.Label;

		public var txt_t6:feathers.controls.Label;

		public var txt_t7:feathers.controls.Label;

		public var txt_t8:feathers.controls.Label;

		public var txt_t9:feathers.controls.Label;

		public var txt_zhenqi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function sx_values_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__sx_values_Skin_UIAsset1_i(),__sx_values_Skin_Label1_i(),__sx_values_Skin_Label2_i(),txt_cur_i(),__sx_values_Skin_Label3_i(),lbl_jy_i(),lbl_zq_i(),pro_jinyan_i(),pro_zhenqi_i(),txt_jinyan_i(),txt_zhenqi_i(),__sx_values_Skin_Group1_i(),txt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __sx_values_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 11;
			temp.y = 109;
			temp.elementsContent = [lbl_t0_i(),lbl_t1_i(),lbl_t2_i(),lbl_t3_i(),lbl_t4_i(),lbl_t5_i(),lbl_t6_i(),lbl_t7_i(),lbl_t8_i(),lbl_t9_i(),lbl_t10_i(),lbl_t11_i(),lbl_t12_i(),lbl_t13_i(),lbl_t14_i(),lbl_t15_i()];
			return temp;
		}

		private function __sx_values_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "关键属性";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 6;
			return temp;
		}

		private function __sx_values_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "秒伤：";
			temp.color = 0xF2B13B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 27;
			temp.y = 28;
			return temp;
		}

		private function __sx_values_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "基础属性";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 53;
			return temp;
		}

		private function __sx_values_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxingkuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_jy_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jy = temp;
			temp.name = "lbl_jy";
			temp.fontSize = 13;
			temp.text = "经验：";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 11;
			temp.y = 69;
			return temp;
		}

		private function lbl_t0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t0 = temp;
			temp.name = "lbl_t0";
			temp.letterSpacing = -1;
			temp.text = "力道：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbl_t10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t10 = temp;
			temp.name = "lbl_t10";
			temp.letterSpacing = -1;
			temp.text = "避闪率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 195;
			return temp;
		}

		private function lbl_t11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t11 = temp;
			temp.name = "lbl_t11";
			temp.letterSpacing = -1;
			temp.text = "防御百分比：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 214;
			return temp;
		}

		private function lbl_t12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t12 = temp;
			temp.name = "lbl_t12";
			temp.letterSpacing = -1;
			temp.text = "生命恢复速度：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 234;
			return temp;
		}

		private function lbl_t13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t13 = temp;
			temp.name = "lbl_t13";
			temp.letterSpacing = -1;
			temp.text = "治疗效果提升：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 253;
			return temp;
		}

		private function lbl_t14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t14 = temp;
			temp.name = "lbl_t14";
			temp.letterSpacing = -1;
			temp.text = "暴击率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 273;
			return temp;
		}

		private function lbl_t15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t15 = temp;
			temp.name = "lbl_t15";
			temp.letterSpacing = -1;
			temp.text = "暴击加成：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 292;
			return temp;
		}

		private function lbl_t1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t1 = temp;
			temp.name = "lbl_t1";
			temp.letterSpacing = -1;
			temp.text = "根骨：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function lbl_t2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t2 = temp;
			temp.name = "lbl_t2";
			temp.letterSpacing = -1;
			temp.text = "慧根：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function lbl_t3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t3 = temp;
			temp.name = "lbl_t3";
			temp.letterSpacing = -1;
			temp.text = "身法：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function lbl_t4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t4 = temp;
			temp.name = "lbl_t4";
			temp.letterSpacing = -1;
			temp.text = "气血：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 78;
			return temp;
		}

		private function lbl_t5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t5 = temp;
			temp.name = "lbl_t5";
			temp.letterSpacing = -1;
			temp.text = "外功：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 97;
			return temp;
		}

		private function lbl_t6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t6 = temp;
			temp.name = "lbl_t6";
			temp.letterSpacing = -1;
			temp.text = "内功：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 117;
			return temp;
		}

		private function lbl_t7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t7 = temp;
			temp.name = "lbl_t7";
			temp.letterSpacing = -1;
			temp.text = "攻速：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 136;
			return temp;
		}

		private function lbl_t8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t8 = temp;
			temp.name = "lbl_t8";
			temp.letterSpacing = -1;
			temp.text = "命中率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 156;
			return temp;
		}

		private function lbl_t9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_t9 = temp;
			temp.name = "lbl_t9";
			temp.letterSpacing = -1;
			temp.text = "暴击抗性：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 175;
			return temp;
		}

		private function lbl_zq_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zq = temp;
			temp.name = "lbl_zq";
			temp.fontSize = 13;
			temp.text = "真气：";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 11;
			temp.y = 87;
			return temp;
		}

		private function pro_jinyan_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jinyan = temp;
			temp.name = "pro_jinyan";
			temp.height = 13;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role1_Skin;
			temp.value = 80;
			temp.x = 48;
			temp.y = 77;
			return temp;
		}

		private function pro_zhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zhenqi = temp;
			temp.name = "pro_zhenqi";
			temp.height = 11;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role2_Skin;
			temp.value = 100;
			temp.width = 131;
			temp.x = 48;
			temp.y = 95;
			return temp;
		}

		private function txt_cur_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_cur = temp;
			temp.name = "txt_cur";
			temp.bold = true;
			temp.fontSize = 18;
			temp.text = "64777777";
			temp.color = 0xF2B13B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 78;
			temp.y = 27;
			return temp;
		}

		private function txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			txt = temp;
			temp.name = "txt";
			temp.x = 70;
			temp.y = 110;
			temp.elementsContent = [txt_t0_i(),txt_t1_i(),txt_t2_i(),txt_t3_i(),txt_t4_i(),txt_t5_i(),txt_t6_i(),txt_t7_i(),txt_t8_i(),txt_t9_i(),txt_t10_i(),txt_t11_i(),txt_t12_i(),txt_t13_i(),txt_t14_i(),txt_t15_i()];
			return temp;
		}

		private function txt_jinyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_jinyan = temp;
			temp.name = "txt_jinyan";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 71;
			return temp;
		}

		private function txt_t0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t0 = temp;
			temp.name = "txt_t0";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_t10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t10 = temp;
			temp.name = "txt_t10";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 194;
			return temp;
		}

		private function txt_t11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t11 = temp;
			temp.name = "txt_t11";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 213;
			return temp;
		}

		private function txt_t12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t12 = temp;
			temp.name = "txt_t12";
			temp.text = "125/5秒";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 233;
			return temp;
		}

		private function txt_t13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t13 = temp;
			temp.name = "txt_t13";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 252;
			return temp;
		}

		private function txt_t14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t14 = temp;
			temp.name = "txt_t14";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 272;
			return temp;
		}

		private function txt_t15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t15 = temp;
			temp.name = "txt_t15";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 291;
			return temp;
		}

		private function txt_t1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t1 = temp;
			temp.name = "txt_t1";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function txt_t2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t2 = temp;
			temp.name = "txt_t2";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function txt_t3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t3 = temp;
			temp.name = "txt_t3";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function txt_t4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t4 = temp;
			temp.name = "txt_t4";
			temp.text = "47732157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 78;
			return temp;
		}

		private function txt_t5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t5 = temp;
			temp.name = "txt_t5";
			temp.text = "5272";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 97;
			return temp;
		}

		private function txt_t6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t6 = temp;
			temp.name = "txt_t6";
			temp.text = "5272";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 116;
			return temp;
		}

		private function txt_t7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t7 = temp;
			temp.name = "txt_t7";
			temp.text = "125/5秒";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 136;
			return temp;
		}

		private function txt_t8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t8 = temp;
			temp.name = "txt_t8";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function txt_t9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_t9 = temp;
			temp.name = "txt_t9";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 175;
			return temp;
		}

		private function txt_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_zhenqi = temp;
			temp.name = "txt_zhenqi";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 89;
			return temp;
		}

	}
}