package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.country.bangpai.mc.UIMovieClipIcon_guild_pos;
	import org.mokylin.skin.common.version_3.J_jindutiao.ProgressBar_YellowSkin;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var fanrong:feathers.controls.Label;

		public var fanrongduBar:feathers.controls.ProgressBar;

		public var getPrizeBtn:feathers.controls.Button;

		public var guildLeader:feathers.controls.Label;

		public var guildLeader0:feathers.controls.Label;

		public var guildLeader1:feathers.controls.Label;

		public var guildLeader2:feathers.controls.Label;

		public var guildLingDi:feathers.controls.Label;

		public var guildName:feathers.controls.Label;

		public var guildPlayerNum:feathers.controls.Label;

		public var guildShop:feathers.controls.Button;

		public var kuCunSilver2:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var modifyBtn:feathers.controls.Button;

		public var mujuan:feathers.controls.Button;

		public var notifyText:feathers.controls.Label;

		public var outGuild:feathers.controls.Button;

		public var reqJionGuildList:feathers.controls.Button;

		public var reqJoinGuildTip:feathers.controls.UIAsset;

		public var selfFamily:feathers.controls.Label;

		public var selfGongxian:feathers.controls.Label;

		public var societyNum:feathers.controls.Label;

		public var upgrade:feathers.controls.Button;

		public var zhiwei:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 883;
			this.elementsContent = [__GuildInfoPanelSkin_UIAsset1_i(),__GuildInfoPanelSkin_UIAsset2_i(),__GuildInfoPanelSkin_UIAsset3_i(),__GuildInfoPanelSkin_UIAsset4_i(),__GuildInfoPanelSkin_UIAsset5_i(),__GuildInfoPanelSkin_Label1_i(),__GuildInfoPanelSkin_Label2_i(),__GuildInfoPanelSkin_UIAsset6_i(),__GuildInfoPanelSkin_UIAsset7_i(),__GuildInfoPanelSkin_UIAsset8_i(),__GuildInfoPanelSkin_UIAsset9_i(),__GuildInfoPanelSkin_UIAsset10_i(),__GuildInfoPanelSkin_UIAsset11_i(),__GuildInfoPanelSkin_UIAsset12_i(),modifyBtn_i(),upgrade_i(),mujuan_i(),notifyText_i(),guildName_i(),fanrong_i(),__GuildInfoPanelSkin_Label3_i(),guildLingDi_i(),__GuildInfoPanelSkin_Label4_i(),societyNum_i(),__GuildInfoPanelSkin_Label5_i(),guildPlayerNum_i(),__GuildInfoPanelSkin_Label6_i(),kuCunSilver2_i(),__GuildInfoPanelSkin_Label7_i(),guildLeader_i(),guildLeader0_i(),guildLeader1_i(),guildLeader2_i(),__GuildInfoPanelSkin_Label8_i(),__GuildInfoPanelSkin_Label9_i(),__GuildInfoPanelSkin_Label10_i(),__GuildInfoPanelSkin_UIAsset13_i(),__GuildInfoPanelSkin_UIAsset14_i(),__GuildInfoPanelSkin_Label11_i(),__GuildInfoPanelSkin_UIAsset15_i(),__GuildInfoPanelSkin_Label12_i(),__GuildInfoPanelSkin_UIAsset16_i(),__GuildInfoPanelSkin_UIAsset17_i(),__GuildInfoPanelSkin_UIAsset18_i(),__GuildInfoPanelSkin_UIAsset19_i(),__GuildInfoPanelSkin_Label13_i(),__GuildInfoPanelSkin_Label14_i(),__GuildInfoPanelSkin_Label15_i(),__GuildInfoPanelSkin_Label16_i(),__GuildInfoPanelSkin_Label17_i(),outGuild_i(),reqJionGuildList_i(),guildShop_i(),getPrizeBtn_i(),list_i(),__GuildInfoPanelSkin_Label18_i(),selfGongxian_i(),selfFamily_i(),__GuildInfoPanelSkin_Label19_i(),__GuildInfoPanelSkin_Label20_i(),zhiwei_i(),fanrongduBar_i(),reqJoinGuildTip_i()];
			
			states = {
				init:[
						{target:"fanrongduBar",
							name:"paddingLeft",
							value:8
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildInfoPanelSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "副帮主：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 674;
			temp.y = 88;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 397;
			temp.y = 133;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "贡献";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 464;
			temp.y = 132;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "战力";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 539;
			temp.y = 132;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族人数";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 621;
			temp.y = 132;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "官职数";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 700;
			temp.y = 132;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 777;
			temp.y = 132;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 274;
			temp.y = 132;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派贡献：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = 319;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label19_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派职位：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = 347;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 22;
			temp.text = "墨";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 69;
			temp.y = 34;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label20_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "所属家族：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 23;
			temp.y = 376;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "6级";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 30;
			temp.x = 69;
			temp.y = 71;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派领地：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 444;
			temp.y = 17;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "家 族 数：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 444;
			temp.y = 40;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派成员：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 444;
			temp.y = 64;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派资金：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 444;
			temp.y = 88;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮  主：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 674;
			temp.y = 17;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "副帮主：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 674;
			temp.y = 40;
			return temp;
		}

		private function __GuildInfoPanelSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "副帮主：";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 674;
			temp.y = 64;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/biao_ti_di.png";
			temp.x = 3;
			temp.y = 268;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/gong_gao.png";
			temp.x = 106;
			temp.y = 120;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/wo_de_xin_xi.png";
			temp.x = 88;
			temp.y = 271;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.width = 614;
			temp.x = 260;
			temp.y = 118;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 264;
			temp.y = 131;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 333;
			temp.y = 131;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 404;
			temp.y = 129;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 487;
			temp.y = 129;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 568;
			temp.y = 129;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 642;
			temp.y = 129;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 318;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 616;
			temp.x = 260;
			temp.y = 119;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/bei_jing_tu_1.png";
			temp.width = 862;
			temp.x = 9;
			temp.y = 7;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/Q_qihao/di.png";
			temp.x = 32;
			temp.y = 7;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/Q_qihao/di_wen_3.png";
			temp.x = 63;
			temp.y = 29;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/Q_qihao/bian_kuang_3.png";
			temp.x = 63;
			temp.y = 29;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 871;
			temp.x = 6;
			temp.y = 115;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 618;
			temp.x = 259;
			temp.y = 437;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 370;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 256;
			temp.y = 118;
			return temp;
		}

		private function __GuildInfoPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/biao_ti_di.png";
			temp.x = 3;
			temp.y = 118;
			return temp;
		}

		private function fanrong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fanrong = temp;
			temp.name = "fanrong";
			temp.fontSize = 16;
			temp.text = "繁荣度：900/1000";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 218;
			temp.x = 145;
			temp.y = 74;
			return temp;
		}

		private function fanrongduBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			fanrongduBar = temp;
			temp.name = "fanrongduBar";
			temp.height = 15;
			temp.paddingRight = 8;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.version_3.J_jindutiao.ProgressBar_YellowSkin);
			temp.value = 10;
			temp.width = 173;
			temp.x = 136;
			temp.y = 49;
			return temp;
		}

		private function getPrizeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			getPrizeBtn = temp;
			temp.name = "getPrizeBtn";
			temp.height = 35;
			temp.label = "帮派俸禄";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 20;
			temp.y = 445;
			return temp;
		}

		private function guildLeader0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildLeader0 = temp;
			temp.name = "guildLeader0";
			temp.fontSize = 14;
			temp.text = "帮主名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 137;
			temp.x = 735;
			temp.y = 40;
			return temp;
		}

		private function guildLeader1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildLeader1 = temp;
			temp.name = "guildLeader1";
			temp.fontSize = 14;
			temp.text = "帮主名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 137;
			temp.x = 735;
			temp.y = 64;
			return temp;
		}

		private function guildLeader2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildLeader2 = temp;
			temp.name = "guildLeader2";
			temp.fontSize = 14;
			temp.text = "帮主名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 137;
			temp.x = 735;
			temp.y = 88;
			return temp;
		}

		private function guildLeader_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildLeader = temp;
			temp.name = "guildLeader";
			temp.fontSize = 14;
			temp.text = "帮主名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 137;
			temp.x = 735;
			temp.y = 18;
			return temp;
		}

		private function guildLingDi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildLingDi = temp;
			temp.name = "guildLingDi";
			temp.fontSize = 14;
			temp.text = "王城";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 518;
			temp.y = 18;
			return temp;
		}

		private function guildName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildName = temp;
			temp.name = "guildName";
			temp.fontSize = 18;
			temp.text = "墨势力网游公会";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 167;
			temp.x = 145;
			temp.y = 17;
			return temp;
		}

		private function guildPlayerNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guildPlayerNum = temp;
			temp.name = "guildPlayerNum";
			temp.fontSize = 14;
			temp.text = "200/600";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 518;
			temp.y = 65;
			return temp;
		}

		private function guildShop_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			guildShop = temp;
			temp.name = "guildShop";
			temp.height = 35;
			temp.label = "帮派商店";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 135;
			temp.y = 447;
			return temp;
		}

		private function kuCunSilver2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kuCunSilver2 = temp;
			temp.name = "kuCunSilver2";
			temp.fontSize = 14;
			temp.text = "99锭 99两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 518;
			temp.y = 89;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 277;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 613;
			temp.x = 262;
			temp.y = 156;
			return temp;
		}

		private function modifyBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			modifyBtn = temp;
			temp.name = "modifyBtn";
			temp.height = 20;
			temp.label = "修改";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 54;
			temp.x = 198;
			temp.y = 246;
			return temp;
		}

		private function mujuan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			mujuan = temp;
			temp.name = "mujuan";
			temp.height = 20;
			temp.label = "捐";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 22;
			temp.x = 619;
			temp.y = 88;
			return temp;
		}

		private function notifyText_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			notifyText = temp;
			temp.name = "notifyText";
			temp.height = 89;
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 236;
			temp.x = 12;
			temp.y = 153;
			return temp;
		}

		private function outGuild_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			outGuild = temp;
			temp.name = "outGuild";
			temp.height = 35;
			temp.label = "退出帮派";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 752;
			temp.y = 445;
			return temp;
		}

		private function reqJionGuildList_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			reqJionGuildList = temp;
			temp.name = "reqJionGuildList";
			temp.height = 35;
			temp.label = "审批列表";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 633;
			temp.y = 445;
			return temp;
		}

		private function reqJoinGuildTip_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			reqJoinGuildTip = temp;
			temp.name = "reqJoinGuildTip";
			temp.styleName = "ui/common/version_3/B_bujian/ti_shi_hong_di.png";
			temp.x = 724;
			temp.y = 444;
			return temp;
		}

		private function selfFamily_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			selfFamily = temp;
			temp.name = "selfFamily";
			temp.text = "帮派名字七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 147;
			temp.x = 98;
			temp.y = 376;
			return temp;
		}

		private function selfGongxian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			selfGongxian = temp;
			temp.name = "selfGongxian";
			temp.text = "999999999";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 147;
			temp.x = 98;
			temp.y = 319;
			return temp;
		}

		private function societyNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			societyNum = temp;
			temp.name = "societyNum";
			temp.fontSize = 14;
			temp.text = "2/5";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 518;
			temp.y = 41;
			return temp;
		}

		private function upgrade_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			upgrade = temp;
			temp.name = "upgrade";
			temp.height = 20;
			temp.label = "升级";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 41;
			temp.x = 325;
			temp.y = 46;
			return temp;
		}

		private function zhiwei_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			zhiwei = temp;
			temp.name = "zhiwei";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.bangpai.mc.UIMovieClipIcon_guild_pos);
			temp.x = 93;
			temp.y = 346;
			return temp;
		}

	}
}