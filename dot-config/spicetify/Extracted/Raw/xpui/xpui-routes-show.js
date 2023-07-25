"use strict";(("undefined"!=typeof self?self:global).webpackChunkopen=("undefined"!=typeof self?self:global).webpackChunkopen||[]).push([[5713],{51450:(e,t,a)=>{a.d(t,{V:()=>E,e:()=>A});var i=a(59496),s=a(61740),o=a(37840),n=a(50346),r=a(23451),l=a(64238),c=a(73769),d=a(54126),u=a(84449),g=a(92009),m=a(97302),p=a(6142),h=a(95663),x=a(4055),y=a(65970),b=a(54299),k=a(4882),j=a(90303),f=a(98340),v=a(54186),P=a(91048),C=a(96170),S=a(73972),w=a(94033),I=a(72171),N=a(4637);function A(e){return{uri:e.uri,name:e.name,trailer:e.trailer,showTypes:e.showTypes}}const D=e=>`activation-trigger-mme-${e}`,E=i.memo((function({index:e=-1,showMetadata:t,episode:a,usePlayContextItem:E,status:R,variant:U}){const F=(0,I.E)(),B=a.playedState.playPositionMilliseconds,T=a.uri,O=(0,i.useRef)(null),[L,M]=(0,i.useState)(a.playedState.state===S.sY.Completed),_=(0,p.O)(),z=(0,x.g)(),W=(0,v.jh)(),G=(0,h.o)(),H=(0,s.I0)(),{UBIFragment:K,spec:V,logger:Z}=(0,C.fU)(o.createDesktopEpisodeBlockEventFactory,{data:{uri:T,reason:a.requestId||"",position:e}}),Y=(0,C.Wi)(V),{isActive:X,isPlaying:q,togglePlay:$}=E({uri:T}),[J]=(0,P.z)(1e4,(e=>e?.item?.uri===T));(0,i.useEffect)((()=>{q&&(O.current=J)}),[q,J]),(0,i.useEffect)((()=>{!q&&O.current&&a.duration.milliseconds<=O.current&&M(!0)}),[q,a.duration.milliseconds]);const Q=(0,i.useCallback)((e=>{e||(O.current=0),M(e)}),[]),ee=A(t),te=(0,y.s)({...a,coverArt:{sources:a.coverArt}},ee),ae=(0,i.useCallback)((()=>{if(a.episodeType===S.Wf.Episode&&F)g.y.set((()=>({triggerId:D(a.uri),triggerAction:null})));else if(z)te();else{let e;e=q?V.playButtonFactory().hitPause({itemToBePaused:T}):X?V.playButtonFactory().hitResume({itemToBeResumed:T}):V.playButtonFactory().hitPlay({itemToBePlayed:T});const t=Z.logInteraction(e);G({targetUri:T,intent:q?"pause":"play",type:"click"}),$({loggingParams:t})}}),[X,te,G,$,T,q,z,a,F,Z,V]),ie=(0,i.useCallback)((()=>{Z.logInteraction(V.hitUiNavigate({destination:T})),G({type:"click",targetUri:T,intent:"navigate"})}),[T,G,Z,V]),se=a.podcastSubscription?.isPaywalled??!1,oe=a.podcastSubscription?.isUserSubscribed??!1,ne=se&&!oe,re=se&&z,{badges:le}=(0,w.r)({contentRating:a.contentRating?.label,isPaywalled:se}),ce=(0,i.useCallback)((()=>H((0,r.RM)(t.uri))),[t.uri,H]),de=(0,i.useCallback)((e=>{let i=e;return(ne||re)&&(i=(0,N.jsx)(u.l,{enabled:!0,showUri:t.uri,children:i})),!a.playability.playable&&le.nineteen&&(i=(0,N.jsx)("div",{onClick:e=>{e.stopPropagation(),ce()},children:e})),i=(0,N.jsx)(l.D,{id:D(T),targetURI:(0,n.EC)(T),children:i}),i}),[T,ne,re,t.uri,le.nineteen,a.playability.playable,ce]);return(0,N.jsx)(K,{spec:V,children:(0,N.jsx)(f.ZP,{value:"row",index:e,children:(0,N.jsx)(b._,{onShow:()=>{Z.logInteraction(V.secondaryHitUiReveal())},menu:(0,N.jsx)(c.k,{uri:T,showUri:t.uri,sharingInfo:a.sharingInfo,isPlayed:L,onMarkAsPlayed:Q}),children:(0,N.jsx)(d.X,{ref:Y,requestId:a.requestId,index:e,uri:T,size:W,images:a.coverArt||[],name:a.name,showName:t.name,description:a.description,isPlayable:a.playability.playable||ne,fullyPlayed:L,durationMs:a.duration.milliseconds,releaseDate:a.releaseDate?.isoString||"",resumePositionMs:O.current??B,handleDragStart:e=>{if(e.target!==e.currentTarget)return;const i=`${a.name} • ${t.name}`;_(e,[T],i,t.uri)},handlePlaybackClick:ae,handleClick:ie,isCurrentlyPlaying:X,isPaywalled:se,isUserSubscribed:oe,isPlaying:q,position:q?J:void 0,episodeSharingInfo:a.sharingInfo,onMarkAsPlayed:Q,contentInformation:a.contentInformation,badges:(0,N.jsxs)(N.Fragment,{children:[le.explicit&&(0,N.jsx)(k.N,{}),le.paid&&(0,N.jsx)(m.g,{}),le.nineteen&&(0,N.jsx)(j.X,{size:16})]}),playButtonWrapper:de,onMoreButtonClick:()=>{Z.logInteraction(V.moreButtonFactory().hitUiReveal())},status:R,variant:U})})})})}))},67484:(e,t,a)=>{a.r(t),a.d(t,{default:()=>Ma});var i=a(59496),s=a(61740),o=a(89605),n=a(11707),r=a(47792),l=a(3802),c=a(91703),d=a(23627),u=a(84875),g=a.n(u),m=a(56162),p=a(36844),h=a(20432),x=a(10650),y=a(35394),b=a(44355),k=a(95663),j=a(64826),f=a(69812),v=a(25915),P=a(4882),C=a(42543),S=a(38127);const w="_yl4tOZxcpoUt28k6B8I",I="lcJflizNrSwDM9yPNk6h",N="ret7iHkCxcJvsZU14oPY";var A=a(4637);const D=({rating:e,className:t,onClick:a})=>{if(!e)return null;const i=Boolean(e.rating?.rating);return(0,A.jsxs)("button",{className:g()(w,t),onClick:a,children:[(0,A.jsx)(m.D,{dir:"auto",variant:"mestoBold",children:e.averageRating?.showAverage?l.ag.formatNumber(e.averageRating.average,{maximumFractionDigits:1}):l.ag.get("web-player.audiobooks.noRating")}),i?(0,A.jsx)(C.u,{iconSize:16,className:g()(I)}):(0,A.jsx)(S.G,{iconSize:16,className:g()(I)}),e.averageRating?.showAverage&&(0,A.jsxs)(m.D,{variant:"mesto",className:g()(N),children:["(",l.ag.formatNumberCompact(Number(e.averageRating.totalRatings)),")"]})]})};var E=a(44526),R=a(81281),U=a(42531),F=a(9374);const B="SpVoh9vvBN0kIwzfCiBh",T="nsGHaEmn310z9W4RMbb8",O="PfYVlZzroXSurDmS_kxY",L="kCT99_BcJQtW47mEfVF6",M="gmDgEbPyRXNixmjYAT9f",_="XlZGcb86bItwlMPQ2jOf",z="VGTtqfOlX2jIbpff6mPP",W="aexqooSgfdW95poEaxjH",G="Fui2wGupk4F1Khigbrhj",H="jWcvSz47NFpbLjnkFT1O",K="Oo6MP8F01W5uGlnw8dag";var V=a(60599),Z=a(90303),Y=a(49513),X=a(94033),q=a(17201);let $=function(e){return e.SMALL="small",e.LARGE="large",e}({});const J=({images:e,title:t,contentRating:a,duration:i,moreButton:s,onClick:o,onContextMenu:n,onTouchStart:r,onTouchEnd:l,isPlaying:c,isActive:d,size:u,className:p,label:h,isPlayable:x=!0})=>{const y=u===$.LARGE?"md":"sm",{badges:b}=(0,X.r)({contentRating:a});return(0,A.jsxs)("div",{"data-testid":"trailer-component",className:g()(B,p,{[T]:d}),onContextMenu:n,onTouchStart:r,onTouchEnd:l,children:[(0,A.jsxs)("div",{className:L,children:[(0,A.jsxs)("div",{className:W,children:[(0,A.jsx)(R.O,{type:F.p.EPISODE,title:t,className:g()(z,{[K]:u===$.SMALL,[H]:u===$.LARGE}),size:U.m$.SIZE_56,images:e,shape:R.K.ROUNDED_CORNERS}),(0,A.jsx)("div",{className:G,children:(0,A.jsx)(q.f,{"data-testid":"trailer-play-button",version:V.ul.transparent,size:y,isPlaying:c,onClick:o,disabled:!x})})]}),(0,A.jsxs)("div",{children:[(0,A.jsx)("div",{className:M,children:(0,A.jsx)(m.D,{dir:"auto",className:O,variant:"balladBold",children:t})}),(0,A.jsxs)("div",{className:_,children:[(0,A.jsx)(Y.V,{text:h}),b.explicit&&(0,A.jsx)(P.N,{}),b.nineteen&&(0,A.jsx)(Z.X,{}),(0,A.jsx)(m.D,{dir:"auto",variant:"mesto",children:(0,A.jsx)(E.nL,{durationMs:i})})]})]})]}),s]})};var Q=a(54186),ee=a(56038),te=a(48607),ae=a(6444),ie=a(96170),se=a(34223);const oe=({htmlDescription:e,narrators:t,spec:a})=>{const s=(0,k.o)(),o=(0,ie.$P)(),n=(0,i.useCallback)((e=>{s({intent:"expand-description",type:"click"});const t=a.seeMoreButtonFactory();o.logInteraction(e?t.hitUiReveal():t.hitUiHide())}),[o,s,a]);return(0,A.jsxs)(A.Fragment,{children:[t.length?(0,A.jsx)(m.D,{as:"p",variant:"ballad",children:l.ag.get("web-player.audiobooks.narratedByX",t.join(l.ag.getSeparator()))}):null,e&&(0,A.jsx)(se.o,{maxLines:4,content:e,htmlContent:e,onExpanded:n})]})};var ne=a(4270),re=a(14241),le=a(66632),ce=a(13655);const de=i.memo((function({uri:e,size:t=ce.q.md,className:a,onClick:s}){const[o,n]=(0,le.Z)(e),r=(0,k.o)(),l=(0,i.useCallback)((()=>{r({targetUri:e,intent:o?"unsave":"save",type:"click"}),n(!o)}),[r,e,o,n]);return(0,A.jsx)(ce.o,{className:a,isFollowing:o,onFollow:l,onClick:s,uri:e,size:t})}));var ue=a(99553);const ge="8px";var me=a(59200),pe=a(82538),he=a(77312),xe=a(85830),ye=a(79475),be=a(23062),ke=a(4055),je=a(70175);const fe={button:"iZut9Dh2KEjNVhDUxzWw"};function ve({uri:e,price:t,isConsumptionCapped:a,size:i,spec:s,logger:o,onPlayback:n}){const r=(0,je.k)(),c=(0,ke.g)(),d=0===t?.finalPrice?.amount,u=d?s.getButtonFactory({uri:e}):s.buyButtonFactory({uri:e}),g=(0,xe.y1)((async()=>{if(o.logInteraction(u.hitShowPaywall({paywalledItem:e})),c||a)n();else{try{t?.finalPrice?await(0,be.Q)({show_uri:e,currency:t.finalPrice.currency,price:t.finalPrice.amount}):r(l.ag.get("error.generic"))}catch(e){r(l.ag.get("error.generic"))}n()}}),2e3,{leading:!0,trailing:!1});return(0,A.jsx)(ye.D,{buttonSize:i,className:fe.button,style:{flexShrink:0},onClick:g,children:d?l.ag.get("web-player.audiobooks.buyFree"):l.ag.get("web-player.audiobooks.buy")})}const Pe=({uri:e,isLocked:t,price:a,isPlaying:i,isConsumptionCapped:s,onPlayback:o,logger:n,spec:r,size:l="lg"})=>t?(0,A.jsx)(ve,{size:l,uri:e,isConsumptionCapped:s,price:a,logger:n,spec:r,onPlayback:o}):(0,A.jsx)(he.$,{size:l,isPlaying:i,uri:e,onClick:o});var Ce=a(49663),Se=a(32812);const we=i.memo((function({backgroundColor:e,uri:t,name:a,isPlaying:s,togglePlay:o,isLocked:n,price:r,isConsumptionCapped:c,spec:d}){const[u,g]=(0,le.Z)(t),m=!(0,Se.k)(),p=(0,k.o)(),h=(0,ie.$P)(),x=(0,i.useCallback)((()=>{p({targetUri:t,intent:u?"unsave":"save",type:"click"});const e=d.saveToLibraryButtonFactory();u?h.logInteraction(e.hitUnfollow({itemToBeUnfollowed:t})):h.logInteraction(e.hitFollow({itemToBeFollowed:t})),g(!u)}),[p,t,u,d,g,h]),b=(0,i.useCallback)(((e,a)=>{const i=d.downloadButtonFactory();a===pe.mc.ADD?h.logInteraction(i.hitDownload({itemToDownload:t})):a===pe.mc.REMOVE?h.logInteraction(i.hitRemoveDownload({itemToRemoveFromDownloads:t})):a===pe.mc.NO_PERMISSION&&h.logInteraction(i.hitUiReveal())}),[h,d,t]),j=(0,i.useCallback)((()=>{const e=d.contextButtonFactory().hitUiReveal();h.logInteraction(e)}),[h,d]);return(0,A.jsx)(ne.o,{backgroundColor:e,style:{"--action-bar-padding-bottom":ge},children:(0,A.jsxs)(ne.F,{children:[(0,A.jsx)(Pe,{uri:t,isLocked:n,price:r,isPlaying:s,isConsumptionCapped:c,onPlayback:o,logger:h,spec:d}),(0,A.jsx)(Ce.r,{children:(0,A.jsx)(re.H,{isAdded:u,onClick:x,disabled:m,size:re.q.md,isAudiobook:!0})},"follow-button"),!n&&(0,A.jsx)(de,{uri:t,onClick:b}),(0,A.jsx)(me.yj,{menu:(0,A.jsx)(ue.X,{uri:t}),children:(0,A.jsx)(y.z,{label:l.ag.get("more.label.context",a),onClick:j})})]})})}));var Ie=a(41226),Ne=a(16743),Ae=a(73997);const De=i.memo((function({coverArt:e,name:t,authorName:a,uri:i,backgroundColor:s,isPlaying:o,togglePlay:n,isLocked:r,price:c,isConsumptionCapped:d,logger:u,spec:g}){return(0,A.jsxs)(Ie.gF,{backgroundColor:s,children:[(0,A.jsxs)(Ne.W,{children:[(0,A.jsx)(Pe,{uri:i,isLocked:r,price:c,isPlaying:o,isConsumptionCapped:d,onPlayback:n,logger:u,spec:g,size:"md"}),(0,A.jsx)(Ae.i,{text:t,dragUri:i,dragLabel:t})]}),(0,A.jsx)(me._P,{menu:(0,A.jsx)(ue.X,{uri:i}),children:(0,A.jsx)(Ie.Oz,{images:e,name:t,shape:R.K.ROUNDED_CORNERS})}),(0,A.jsxs)(Ie.sP,{children:[(0,A.jsx)(m.D,{variant:"mestoBold",children:l.ag.get("web-player.audiobooks.audiobook")}),(0,A.jsx)(Ie.xd,{canEdit:!1,onClick:()=>{},children:t}),(0,A.jsx)(Ie.QS,{author:a})]})]})})),Ee="HvVxzh4ZoggYAhgSxSth",Re=i.memo((({price:e})=>e.finalPrice&&e.finalListPrice?0===e.finalPrice.amount&&0===e.finalListPrice.amount?(0,A.jsxs)("div",{className:Ee,children:[(0,A.jsx)(m.D,{variant:"cello",semanticColor:"textBase",children:l.ag.get("audiobook.freePriceDescription")}),(0,A.jsx)(m.D,{variant:"mesto",children:l.ag.get("audiobook.freePriceExplanation")})]}):(0,A.jsxs)("div",{className:Ee,children:[(0,A.jsx)(m.D,{variant:"canon",semanticColor:"textBase",children:e.finalPrice.formattedPrice}),e.finalPrice.amount<e.finalListPrice.amount&&(0,A.jsx)(m.D,{variant:"ballad",semanticColor:"textSubdued",children:l.ag.get("web-player.audiobooks.retailPrice",(0,A.jsx)("span",{style:{textDecoration:"line-through"},children:e.finalListPrice.formattedPrice}))})]}):null));var Ue=a(33971),Fe=a(47393);var Be=a(26406);function Te(e){return!e.playability?.playable&&(e.playability?.reason===Be.WY.PaymentRequired||e.playability?.reason===Be.WY.Anonymous)}var Oe=a(97302),Le=a(65439),Me=a(43064),_e=a(99948),ze=a(4464),We=a(82998);const Ge=i.memo((function({uri:e,bookUri:t,size:a=ce.q.md,className:s,onClick:o=(()=>{}),isLocked:n=!0}){const[r,l]=(0,le.Z)(t),c=(0,k.o)(),d=(0,i.useCallback)((()=>{c({targetUri:t,intent:"add-to-library",type:"click"}),l(!0)}),[c,t,l]);return(0,A.jsx)(ce.o,{className:s,isFollowing:r,canDownload:!n,onFollow:d,uri:e,size:a,onClick:o})})),He=i.memo((function(e){return(0,A.jsx)(Ge,{...e})}));var Ke=a(85483),Ve=a(80964),Ze=a(41836);const Ye="b0Vng72SrQiFroJKXfk2",Xe="FfeP3XKSZcAdfviyk8fv",qe="eWxDd0LanTnTlSl8SOHX",$e="eAOkseqV13_CAmzuDJpa",Je="fovofKIYdEIURgIYoKm2",Qe="we_1b4qCQBaFPT12eUXp",et="NXXFrQO7npgPCRuSKaAA",tt="ekkhhuxKVGAzkEmuh9kE",at="zd6xqobF255bxHFtCmXy",it=i.memo((function({name:e,duration:t,uri:a,bookUri:o,bookName:n,usePlayContextItem:r,isLocked:c,isPlayable:d,resumePositionMs:u,isFullyPlayed:h,isExplicit:x,is19PlusOnly:j,spec:f,index:v,consumptionCapExplanation:C}){const S=(0,i.useRef)(u),{isPlaying:w,togglePlay:I,isActive:N}=r({uri:a}),D=(0,ie.$P)(),E=(0,ke.g)(),R=(0,s.I0)(),U=(0,p.W6)(Ze.vW,{loadingValue:!1}),F=(0,_e.Y)((e=>{if(e?.item?.uri===a){const t=(0,ze.k)(e)??0;return S.current=t,t}return 0})),B=(0,Me._)(a),T=(0,i.useCallback)((e=>{e.stopPropagation(),e.preventDefault()}),[]),O=(0,k.o)(),L=(0,i.useCallback)((e=>{if(T(e),C&&!E&&U)return void R((0,Ke.S3)(C));const t=f.chapterBlockFactory({position:v,uri:a}).playButtonFactory();if(c)O({type:"click",intent:"audiobook-gated-entry-point",itemIdSuffix:"target-chapter"}),D.logInteraction(t.hitShowPaywall({paywalledItem:a}));else{const e=(0,Ve.aK)({isPlaying:w,isActive:N,spec:t,logger:D,uri:a});I({loggingParams:e})}}),[C,R,v,U,N,E,c,w,D,O,f,T,I,a]),M=(0,i.useCallback)(((e,t)=>{T(e);const i=f.chapterBlockFactory({position:v,uri:a}).downloadButtonFactory();t===pe.mc.ADD?D.logInteraction(i.hitDownload({itemToDownload:a})):t===pe.mc.REMOVE?D.logInteraction(i.hitRemoveDownload({itemToRemoveFromDownloads:a})):t===pe.mc.NO_PERMISSION&&D.logInteraction(i.hitUiReveal())}),[v,D,f,T,a]),_=(0,i.useCallback)((()=>{const e=f.chapterBlockFactory({position:v,uri:a}).secondaryHitUiReveal();D.logInteraction(e)}),[v,D,f,a]),z=(0,i.useCallback)((e=>{T(e);const t=f.chapterBlockFactory({position:v,uri:a}).contextMenuFactory().hitUiReveal();D.logInteraction(t)}),[v,D,f,T,a]),W=!c,G=(0,A.jsxs)(A.Fragment,{children:[(0,A.jsx)("hr",{className:qe,"aria-hidden":!0}),(0,A.jsxs)("div",{className:Ye,onDoubleClick:e=>{O({targetUri:a,intent:"play",type:"double-click"}),L(e)},children:[(0,A.jsx)(m.D,{as:"h2",variant:"balladBold",className:g()(et,{[Xe]:N}),semanticColor:"textBase",children:e}),(0,A.jsxs)("div",{className:tt,children:[(0,A.jsx)(q.f,{size:"sm",version:q.u.secondary,onClick:L,isPlaying:w,ariaPlayLabel:l.ag.get("tracklist.a11y.play",e,n),ariaPauseLabel:l.ag.get("tracklist.a11y.pause",e,n),locked:c,disabled:!d&&!c}),c?(0,A.jsx)(Oe.g,{}):null,x&&(0,A.jsx)(P.N,{fullText:!0}),j&&(0,A.jsx)(Z.X,{size:16}),(0,A.jsx)("div",{className:at,children:(0,A.jsx)(We.E,{isPlaying:w,fullyPlayed:h,durationMs:t.milliseconds,resumePositionMs:S.current,position:w?F:void 0})})]}),W?(0,A.jsx)(me.yj,{menu:(0,A.jsx)(b.r,{uri:a,showUri:o,isLocked:c}),children:(0,A.jsx)(y.z,{className:Je,size:ce.q.sm,label:l.ag.get("more.label.context",e),onClick:z})}):null,(0,A.jsx)(He,{uri:a,bookUri:o,className:g()({[Qe]:!(0,Le.y)(B)}),onClick:M,size:ce.q.sm,isLocked:c})]})]});return W?(0,A.jsx)(me._P,{menu:(0,A.jsx)(b.r,{uri:a,showUri:o,isLocked:c}),onShow:_,children:(0,A.jsx)("div",{className:$e,children:G})}):(0,A.jsx)("div",{className:$e,children:G})})),st=({bookUri:e,bookName:t,sampleUri:a,isFinishedUnlockingJourney:s,usePlayContextItem:o,spec:n,consumptionCapExplanation:r})=>{const l=function(e,t){const a=(0,Fe.z)();return(0,i.useCallback)((async(i,s)=>a.getBookContents(e,{offset:i,limit:s,doRefreshSubscription:t})),[t,a,e])}(e,s),c=(0,i.useRef)(!1),d=(0,i.useRef)(0),[u,g]=(0,i.useState)([]),m=(0,i.useCallback)((e=>e?.uri===a),[a]),p=(0,i.useCallback)((e=>(e=>null!==e)(e)&&!m(e)),[m]),h=(0,i.useCallback)((()=>{l&&(c.current||null===d.current||(c.current=!0,l(d.current,50).then((e=>{c.current=!1,d.current=e.nextOffset,e.items.length>0&&g((t=>t.concat(e.items.filter(p))))}))))}),[l,p]);return(0,i.useEffect)((()=>{d.current=0,g([])}),[e]),(0,A.jsx)("ul",{children:(0,A.jsx)(Ue.C,{onReachBottom:h,triggerOnInitialLoad:!0,children:u.map(((a,i)=>{const{name:s,duration:l,uri:c,playability:{playable:d},playedState:{playPositionMilliseconds:u,state:g},isExplicit:m,is19PlusOnly:p}=a;return(0,A.jsx)(it,{name:s,duration:l,uri:c,bookUri:e,bookName:t,usePlayContextItem:o,isLocked:Te(a),isPlayable:d,resumePositionMs:u,isFullyPlayed:g===Be.sY.Completed,isExplicit:m,is19PlusOnly:p,spec:n,index:i,consumptionCapExplanation:r},c)}))})})};var ot=a(83680),nt=a(58394),rt=a(66721),lt=a(75207),ct=a(83185);const dt="QEd1L2SSRW1ol_sQQN6m",ut="ENuWK8u3C9kmadnqkErf",gt="i0gSVhns0PjhiUKm4OG1",mt="jKVb6K0dga3SfW1dp2Pg",pt="MOpV0_YizQER2NksxLju",ht="vrR8bh9DvivyDfUrh1vD",xt="_toO3CqMPAPTbny7Rh8R",yt="Iudw61HRePwOAJpbDRvA",bt="GWaz1n1SADn9enzKdi_Z",kt=i.memo((function({coverArt:e,toggleModal:t,uri:a,isBook:i}){const s=(0,lt.X)(e,{desiredSize:320}),{spec:o,logger:n}=(0,ie.fU)(nt.createDesktopPodcastRatingEventFactory,{data:{identifier:i?r.Wg.RATINGS_AND_REVIEWS_RATINGS_AUDIOBOOK:r.Wg.RATINGS_AND_REVIEWS_RATINGS,uri:a}});return(0,A.jsx)(ct.Z,{contentLabel:"podcast-rating-modal",isOpen:!0,onRequestClose:t,children:(0,A.jsxs)("div",{className:dt,children:[(0,A.jsxs)("div",{className:gt,children:[(0,A.jsx)(m.D,{as:"h1",variant:"canon",className:xt,children:l.ag.get("web-player.audiobooks.rating.rateAudiobook")}),(0,A.jsxs)("button",{className:mt,onClick:()=>{const e=o.closeButtonFactory().hitUiNavigateBack();n.logInteraction(e),t()},children:[(0,A.jsx)(ot.k,{role:"presentation"}),(0,A.jsx)("span",{className:"hidden-visually",children:l.ag.get("web-player.audiobooks.rating.closeModal")})]})]}),(0,A.jsxs)("div",{className:pt,children:[(0,A.jsx)(rt.Ee,{loading:"eager",src:s?.url,className:ut}),(0,A.jsxs)("div",{className:ht,children:[(0,A.jsx)(m.D,{as:"p",variant:"cello",className:yt,children:l.ag.get("web-player.audiobooks.rating.wantToRate")}),(0,A.jsx)(m.D,{as:"p",className:bt,children:l.ag.get("web-player.audiobooks.rating.goToApp")}),(0,A.jsx)(ye.D,{colorSet:"invertedLight",onClick:()=>{const e=o.okButtonFactory().hitUiNavigateBack();n.logInteraction(e),t()},children:l.ag.get("web-player.audiobooks.rating.ok")})]})]})]})})}));var jt=a(64052);const ft="mmCZ5VczybT9VqKB5wFU",vt="At_ihDspJfh1yw3Cn2cq",Pt="u3LLJx1KnMchfNCzi6k5",Ct="Yqz1Nv6wj1n3HmXL_qji",St="qRqn3JrWLPbGW9k2a63n",wt="HAah1_lK_dHgyyE71I8Z",It="eiC4nh70nb5UHZBYMgNA",Nt="hl2eRCaYcZ1Jm1bgNYlU",At="eYtmwXEvi1UdCevg8WoK",Dt="QOp2aYTYmZHZ6DFFHuYE",Et=i.memo((function({metadata:e}){const{uri:t,coverArt:a,name:n,htmlDescriptionPlain:d,authorName:u,sample:C,narrators:S,rating:w,isExplicit:I,duration:N,copyrights:R,publishDate:U,price:F,isLocked:B,consumptionCapExplanation:T,gatedContentAccessReason:O}=e,{search:L}=(0,o.TH)(),M=!!new URLSearchParams(L).get("isUnlockingAudiobook"),_=!(!(0,ee.D)(M)||M),z=(0,ke.g)(),W=(0,j.Z)(a[0]?.url),G=(0,s.I0)(),[H,K]=(0,i.useState)(!1),V=(0,k.o)(),Z=(0,p.W6)(Ze.vW,{loadingValue:!1}),{spec:Y,logger:X}=(0,ie.fU)(h.createDesktopAudiobookEventFactory,{data:{uri:t,identifier:r.Wg.PODCAST_SHOW_AUDIOBOOK}}),{spec:q,logger:se}=(0,ie.fU)(h.createDesktopAudiobookEventFactory,{data:{uri:t,identifier:r.Wg.RATINGS_AND_REVIEWS_RATINGS_AUDIOBOOK}}),{spec:ne,logger:re}=(0,ie.fU)(x.createDesktopLockedAudiobookEventFactory,{data:{uri:t,identifier:r.Wg.PODCAST_SHOW_AUDIOBOOK}}),le=(0,i.useMemo)((()=>Y.actionBarFactory()),[Y]),ce=(0,i.useMemo)((()=>q.aboutSectionFactory()),[q]),de=(0,i.useMemo)((()=>Y.chapterListFactory()),[Y]);(0,i.useEffect)((()=>{V({type:"view",intent:"audiobook"})}),[V]),(0,i.useEffect)((()=>{B&&re.logImpression(ne.impression())}),[ne,re,B]);const{isPlaying:ue,togglePlay:ge,usePlayContextItem:me,isActive:pe,triggerPlay:he}=(0,te.n)({uri:t},{featureIdentifier:"audiobook"}),{togglePlay:xe,isPlaying:ye,isActive:be}=(0,te.n)({uri:C?.uri??""},{featureIdentifier:"audiobook"}),je=ue&&!ye,fe=pe&&!be,ve=(0,i.useCallback)((async()=>{const e=Y.actionBarFactory().playButtonFactory();if(T&&!z&&Z)G((0,Ke.S3)(T));else if(!B||z)if(z)ge();else{const a=(0,Ve.aK)({isPlaying:je,isActive:fe,spec:e,logger:X,uri:t});fe?ge({loggingParams:a}):he({loggingParams:a})}else X.logInteraction(e.hitShowPaywall({paywalledItem:t}))}),[Y,T,z,Z,B,G,X,t,ge,je,fe,he]),Pe=(0,i.useCallback)((()=>{C?.uri&&(V({targetUri:C.uri,intent:ye?"play":"pause",type:"click"}),xe())}),[ye,V,xe,C?.uri]),Ce=(0,i.useCallback)((()=>{const e=ce.ratingButtonFactory().hitUiReveal();se.logInteraction(e),K((e=>!e))}),[ce,se]),{ref:Se,breakpoint:Ie}=(0,Q.Db)({[Q.Uo.MEDIUM]:600,[Q.Uo.LARGE]:1024}),Ne=null!=T,Ae=B&&F;return(0,A.jsxs)("section",{ref:Se,className:ft,children:[(0,A.jsx)(c.$,{children:(0,ae.Od)({showOrAudiobookName:n,type:"Audiobook"})}),(0,A.jsx)(De,{name:n,authorName:u,uri:t,coverArt:a,backgroundColor:W,togglePlay:ve,isPlaying:je,isLocked:B,price:F,isConsumptionCapped:Ne,logger:X,spec:Y.actionBarFactory()}),(0,A.jsx)(we,{name:n,backgroundColor:W,uri:t,togglePlay:ve,isPlaying:je,isLocked:B,isExplicit:I,duration:N,publishDate:U,price:F,isConsumptionCapped:Ne,spec:le}),(0,A.jsxs)("div",{className:g()(vt,"contentSpacing",{[Pt]:Ie===Q.Uo.LARGE}),children:[(0,A.jsxs)("div",{className:Ct,children:[(0,A.jsxs)("div",{className:Nt,children:[(0,A.jsxs)("div",{className:At,children:[I&&(0,A.jsx)(P.N,{fullText:!0}),(0,A.jsxs)("div",{children:[U&&(0,A.jsx)(m.D,{variant:"mesto",className:Dt,children:l.ag.formatDate(U)}),(0,A.jsx)(m.D,{variant:"mesto",children:(0,A.jsx)(E.nL,{durationMs:N})})]})]}),(0,jt.c)(O)&&(0,A.jsx)(m.D,{variant:"cello",as:"p",semanticColor:"textBase",children:l.ag.get("audiobook.page.available.premium")}),!(0,jt.c)(O)&&Ae&&(0,A.jsx)(Re,{price:F})]}),(0,A.jsx)(oe,{htmlDescription:d,narrators:S,spec:ce})]}),(0,A.jsxs)("div",{className:St,children:[C&&(0,A.jsx)(J,{label:l.ag.get("audiobook.page.sample"),images:C.coverArt||[],title:C.name,duration:C.duration.milliseconds,moreButton:B?null:(0,A.jsx)(f.y,{menu:(0,A.jsx)(b.r,{uri:C.uri,showUri:t,isLocked:B}),children:(0,A.jsx)(y.z,{})}),onClick:Pe,isPlaying:ye,isActive:be,size:$.LARGE,contentRating:C.contentRating?.label,isPlayable:C.isPlayable}),(0,A.jsx)("div",{className:wt,children:(0,A.jsx)(D,{rating:w,onClick:Ce})})]}),(0,A.jsxs)("div",{className:It,children:[(0,A.jsx)(st,{bookUri:t,bookName:n,sampleUri:C?.uri,isFinishedUnlockingJourney:_,usePlayContextItem:me,spec:de,consumptionCapExplanation:T??void 0},`${t}-${B}`),(0,A.jsx)(v.k,{copyrights:R})]})]}),H&&(0,A.jsx)(kt,{toggleModal:()=>K(!1),coverArt:a,uri:t,isBook:!0})]})}));var Rt=a(71857),Ut=a(98432),Ft=a(90350),Bt=a(47563),Tt=a(762),Ot=a(88959);const Lt=({uri:e,name:t,backgroundColor:a,spec:s})=>{const o=(0,ie.$P)(),n=(0,k.o)(),r=!(0,Se.k)(),[c,d]=(0,le.Z)(e),u=(0,i.useCallback)((()=>{n({targetUri:e,intent:c?"unsave":"save",type:"click"});const t=s.followButtonFactory();o.logInteraction(c?t.hitUnfollow({itemToBeUnfollowed:e}):t.hitFollow({itemToBeFollowed:e})),d(!c)}),[n,e,c,s,o,d]),g=(0,i.useCallback)((()=>{o.logInteraction(s.contextButtonFactory().hitUiReveal())}),[o,s]);return(0,A.jsx)(ne.o,{backgroundColor:a,children:(0,A.jsxs)(ne.F,{children:[(0,A.jsx)(Ce.r,{children:(0,A.jsx)(Ot.e,{isFollowing:c,onClick:u,disabled:r})},"follow-button"),(0,A.jsx)(f.y,{menu:(0,A.jsx)(Tt.M,{uri:e}),onShow:g,children:(0,A.jsx)(y.z,{label:l.ag.get("more.label.context",t)})})]})})},Mt=(0,i.lazy)((()=>a.e(886).then(a.bind(a,886))));function _t(e){return(0,p.W6)(Ze.$f)?(0,A.jsx)(i.Suspense,{fallback:!0,children:(0,A.jsx)(Mt,{...e})}):null}var zt=a(73769),Wt=a(13938),Gt=a(65970),Ht=a(54299),Kt=a(22508),Vt=a(29662),Zt=a(51450),Yt=a(98340),Xt=a(92141);const qt=(0,i.createContext)({setSortState:()=>{throw new Error("setSortState must be used within a ShowFilterProvider")},sortState:[]}),$t=i.memo((function({uri:e,children:t}){return(0,A.jsx)(Xt.r,{uri:e,defaultState:[],sortContext:qt,localStorageKey:"showFilterParams-v2",children:t})}));var Jt=a(66114);const Qt={field:Jt.ay.PUBLISH_DATE,order:Jt.i5.DESC},ea={field:Jt.ay.PUBLISH_DATE,order:Jt.i5.ASC},ta={episodic:Qt,sequential:ea,recent:Qt};function aa(){return new Map([[Qt,{key:"newest-to-oldest",value:l.ag.get("shows.sort.newest-to-oldest")}],[ea,{key:"oldest-to-newest",value:l.ag.get("shows.sort.oldest-to-newest")}]])}function ia(e){return ta[e]}const sa=(0,i.createContext)({setSortState:()=>{throw new Error("setSortState must be used within a ShowSortProvider")},sortState:ia("recent")}),oa=e=>{const t=aa();return Array.from(t.keys()).some((({field:t})=>t===e?.field))},na=i.memo((function({uri:e,children:t,defaultSortParam:a}){return(0,A.jsx)(Xt.r,{uri:e,defaultState:a,sortContext:sa,localStorageKey:"showSortParam",validator:oa,children:t})})),ra="cJJXVm4gQW6AdfCQRhpX",la="hTRqaN61SDG95erQGMmx",ca={totalCount:0,nextOffset:0,items:[]},da=i.memo((function({showMetadata:e,usePlayContextItem:t}){const{sortState:a}=(0,i.useContext)(sa),{sortState:s}=(0,i.useContext)(qt),o=(0,Vt.ZM)(e.uri,a,s),[n,r]=(0,i.useState)(ca),l=(0,i.useRef)(!1),c=(0,i.useRef)(0),d=(0,i.useCallback)(((e=!1)=>{if(!o)return;const t=c.current;null!==t&&(l.current||(l.current=!0,o(t,50).then((a=>{r((i=>{const s=e?[]:[...i.items];return s.splice(t,a.items.length,...a.items),c.current=a.nextOffset,{...a,items:s}})),l.current=!1}))))}),[o]);return(0,i.useEffect)((()=>{r(ca)}),[e.uri]),(0,i.useEffect)((()=>{c.current=0,d(!0)}),[d]),(0,A.jsx)(Yt.ZP,{value:"track-list",children:(0,A.jsx)(Ue.C,{onReachBottom:d,triggerOnInitialLoad:!0,children:n.items.map(((a,i)=>a&&(0,A.jsxs)("div",{className:la,children:[(0,A.jsx)("hr",{className:ra,"aria-hidden":!0}),(0,A.jsx)(Zt.V,{index:i,episode:a,showMetadata:e,usePlayContextItem:t},`${a.uri}/${i}`)]},`${i}${a.uri}`)))})})}));var ua=a(55477);const ga={field:Jt.YG.ISPLAYED,operator:Jt.NK.EQUALS,value:!1},ma={field:Jt.YG.STARTEDPLAYING,operator:Jt.NK.GREATER_THAN,value:0};const pa="all-episodes",ha=({onFilter:e})=>{const{sortState:t,setSortState:a}=(0,i.useContext)(qt),s=new Map([[ga,{key:"is-played",value:l.ag.get("shows.filter.unplayed")}],[ma,{key:"started-playing",value:l.ag.get("shows.filter.in-progress")}]]),o=Array.from(s.values());o.unshift({key:pa,value:l.ag.get("mwp.podcast.all.episodes")});const n=Array.from(s.keys()),r=(0,i.useCallback)((t=>{if(t===pa)a([]);else{const e=n.find((e=>s.get(e)?.key===t));e&&a([e])}e()}),[e,a,n,s]);if(!s.size||!n)return null;let c=o[0];const d=Array.from(s.entries()).filter((e=>t?.some((t=>t.field===e[0].field&&t.operator===e[0].operator))));return d.length>0&&(c=d[0][1]),(0,A.jsx)(ua.A,{options:o,onSelect:e=>r(e),selected:c,variant:"balladBold",semanticColor:"textBase",heading:l.ag.get("drop_down.filter_by")})},xa=({onSort:e})=>{const{sortState:t,setSortState:a}=(0,i.useContext)(sa),s=aa(),o=Array.from(s.values()),n=Array.from(s.keys()),r=(0,i.useCallback)((t=>{const i=n.find((e=>s.get(e)?.key===t));i&&a(i),e()}),[n,e,s,a]);if(!s.size||!t)return null;const c=Array.from(s.keys()).find((e=>e.field===t.field&&e.order===t.order));if(!c)return null;const d=s.get(c);return d?(0,A.jsx)(ua.A,{options:o,onSelect:e=>r(e),selected:d,heading:l.ag.get("drop_down.sort_by")}):null},ya="show-showPage-sectionWrapper",ba="TYB4Y2xQujO7cifhHush",ka="sSXKiPRvp2AHmwfHoCCS",ja="YJlizbhw6DBPHT9OYbdj",fa="klz_XuZpllvTMzpJF1gw",va="TfjbWiK8hca4HHEBnonP",Pa="kR0M2WSYVUj4cohADSFM",Ca="ghfuv80I8uW_ymG_jfx9",Sa="jtfSxoRam9rzTtdXIjzc",wa="fejGrhq7pxGC99cUdyVw",Ia="T0OjvsNXAJJGd23eBG2m",Na="Ppm5YkDdE5ktTPwZC1Dw",Aa=({spec:e})=>{const t=(0,ie.$P)(),{canSort:a,canFilter:s}=(0,Vt.zZ)().capabilities,o=(0,i.useCallback)((()=>{t.logInteraction(e.episodeListFactory().filterButtonFactory().hitFilter())}),[t,e]),n=(0,i.useCallback)((()=>{t.logInteraction(e.episodeListFactory().sortButtonFactory().hitSort())}),[t,e]);return(0,A.jsxs)("div",{className:Pa,children:[s&&(0,A.jsx)("div",{className:Sa,children:(0,A.jsx)(ha,{onFilter:o})}),!s&&(0,A.jsx)(m.D,{as:"h3",variant:"canon",semanticColor:"textBase",className:wa,children:l.ag.get("mwp.podcast.all.episodes")}),a&&(0,A.jsx)("div",{className:Ca,children:(0,A.jsx)(xa,{onSort:n})})]})},Da=e=>{switch(e){case Be.it.TRAILER:return l.ag.get("podcasts.next-episode.trailer");case Be.it.UP_NEXT:return l.ag.get("podcasts.next-episode.up-next");case Be.it.CONTINUE_LISTENING:return l.ag.get("podcasts.next-episode.continue-listening");case Be.it.FIRST_PUBLISHED:return l.ag.get("podcasts.next-episode.first-published");case Be.it.LATEST_PUBLISHED:return l.ag.get("podcasts.next-episode.latest-published");default:return}},Ea=({breakpoint:e,metadata:t,showId:a,spec:s})=>{const{uri:o,trailer:n,topics:r,description:c,htmlDescription:d}=t,u=(0,ie.$P)(),h=(0,i.useMemo)((()=>s.episodeListFactory()),[s]),x=(0,p.W6)(Ze.Vz),b=(0,k.o)(),j=(0,p.W6)(Ze.Cz),P=(0,ke.g)(),{sortState:C}=(0,i.useContext)(sa),{sortState:S}=(0,i.useContext)(qt),w=(0,Vt.zZ)(),{usePlayContextItem:I}=(0,te.n)({uri:o,metadata:{[Kt.sb.SORTING_CRITERIA]:w.getPlayerSort(C),[Kt.sb.FILTERING_PREDICATE]:w.getPlayerFilter(S)}},{featureIdentifier:"show"}),{isActive:N,isPlaying:D,togglePlay:E}=I({uri:n?.uri||""}),R=(0,i.useCallback)((e=>{b({intent:"expand-description",type:"click"});const t=s.aboutSectionFactory().seeMoreButtonFactory(),a=e?t.hitUiReveal():t.hitUiHide();u.logInteraction(a)}),[u,b,s]),U=(0,i.useCallback)(((e,t)=>{const a=s.aboutSectionFactory().topicFactory(t).hitUiNavigate({destination:t.uri});u.logInteraction(a)}),[u,s]),F=n?{name:n.name,uri:n.uri,audio:{items:n.audio.items.map((e=>({url:e.url})))}}:null,B=(0,Zt.e)(t),T=(0,Gt.s)(F,B),O=(0,i.useCallback)((()=>{n?.uri&&(P?T():(b({targetUri:n.uri,intent:D?"play":"pause",type:"click"}),E()))}),[T,P,D,b,E,n?.uri]),{ref:L,breakpoint:M}=(0,Q.Db)({[Q.Uo.MEDIUM]:0,[Q.Uo.LARGE]:600}),_=r.length>0,z=c||j&&d,W=z||_;return(0,A.jsxs)("div",{className:g()(ba,"contentSpacing",{[ka]:e===Q.Uo.LARGE}),children:[(0,A.jsxs)("div",{className:ja,children:[W&&(0,A.jsxs)(A.Fragment,{children:[(0,A.jsx)(m.D,{as:"h3",variant:"canon",semanticColor:"textBase",className:wa,children:l.ag.get("artist.about")}),z&&(0,A.jsx)(se.o,{maxLines:4,content:(c||"").trim(),onExpanded:R,htmlContent:j&&d?d:void 0}),_&&(0,A.jsx)(Wt.v,{topics:r,onClick:U})]}),(0,A.jsx)(_t,{showId:a,uri:o}),n&&!x&&(0,A.jsx)(Ht._,{menu:(0,A.jsx)(zt.k,{uri:n.uri,showUri:o,sharingInfo:n.sharingInfo}),children:(0,A.jsx)(J,{label:l.ag.get("track-trailer"),className:Ia,images:n.coverArt||[],title:n.name,duration:n.duration.milliseconds,moreButton:(0,A.jsx)(f.y,{menu:(0,A.jsx)(zt.k,{uri:n.uri,sharingInfo:n.sharingInfo,showUri:o}),children:(0,A.jsx)(y.z,{})}),onClick:O,isPlaying:D,isActive:N,size:$.LARGE,contentRating:n.contentRating?.label})})]}),(0,A.jsx)(Q.ZU.Provider,{value:M,children:(0,A.jsxs)("div",{className:va,"data-testid":"show-all-episode-list",ref:L,children:[x&&t.nextBestEpisode&&(0,A.jsx)(Zt.V,{showMetadata:t,episode:t.nextBestEpisode.data,usePlayContextItem:I,status:Da(t.nextBestEpisode.type),variant:"next-best-episode"}),(0,A.jsx)(Aa,{spec:s}),(0,A.jsx)(ie.Nh,{spec:h,children:(0,A.jsx)(da,{showMetadata:t,usePlayContextItem:I})})]})}),(0,A.jsx)(v.k,{copyrights:[]})]})},Ra=i.memo(Ea);var Ua=a(477);const Fa=({reason:e})=>{const t=(0,p.W6)(Ze.AL),a=function(e){switch(e){case"OTP":return l.ag.get("podcasts.subscriber-indicator.otp");case"SUBSCRIPTION":return l.ag.get("podcasts.subscriber-indicator.subscription");default:return""}}(e);return t&&a?(0,A.jsx)(m.D,{className:Na,children:a}):null};const Ba=({metadata:e,backgroundColor:t})=>{const{uri:a,coverArt:i,name:s,podcastType:o,publisherName:n,gatedContentAccessReason:r}=e,{isXSOnly:c,isSMOnly:d}=(0,Ua.e)(),u=c||d;return(0,A.jsxs)(Ie.gF,{backgroundColor:t,children:[(0,A.jsx)(Ne.W,{children:(0,A.jsx)(Ae.i,{text:s,dragUri:a,dragLabel:s})}),(0,A.jsx)("div",{className:fa,children:(0,A.jsx)(Ht._,{menu:(0,A.jsx)(Tt.M,{uri:a}),children:(0,A.jsx)(Ie.Oe,{loading:"eager",name:s,images:i,placeholderType:"show",shape:Ie.Kc.ROUNDED_CORNERS})})}),(0,A.jsxs)(Ie.sP,{children:[(0,A.jsxs)(m.D,{variant:"mestoBold",children:["SHOW"===o?l.ag.get("type.show"):l.ag.get("type.podcast"),r&&(0,A.jsx)(Fa,{reason:r})]}),(0,A.jsx)(Ht._,{menu:(0,A.jsx)(Tt.M,{uri:a}),children:(0,A.jsx)(Ie.xd,{dragUri:a,dragLabel:s,children:(0,A.jsx)("span",{"data-testid":"show-title",children:s})})}),(0,A.jsx)(m.D,{variant:u?"cello":"canon",children:n})]})]})};var Ta=a(31503),Oa=a(13198);const La=({metadata:e,showId:t})=>{const{coverArt:a,name:r,uri:l}=e,{spec:d}=(0,ie.fU)(n.createDesktopPodcastEventFactory,{data:{uri:l}}),u=(0,i.useMemo)((()=>d.actionBarFactory()),[d]),g=(0,j.Z)(a[0]?.url||null),{ref:m,breakpoint:p}=(0,Q.Db)({[Q.Uo.MEDIUM]:600,[Q.Uo.LARGE]:1024}),h=(0,s.v9)(Ta.vT),x=(0,Bt.l3)(h,t),y=(0,o.TH)(),b=(0,Rt.vI)(Ft.k.VideoPodcastShowTitleTag,y),k=x||b;return(0,A.jsxs)("section",{ref:m,className:ya,children:[(0,A.jsx)(c.$,{children:(0,ae.Od)({showOrAudiobookName:r,type:"Podcast",isVideoPodcastShowTitleTagEnabled:k})}),(0,A.jsx)(Ba,{metadata:e,backgroundColor:g}),(0,A.jsx)(Lt,{uri:l,name:r,backgroundColor:g,spec:u}),(0,A.jsx)(Ra,{breakpoint:p,metadata:e,showId:t,spec:d})]})},Ma=(0,i.memo)((function(){const{showId:e=""}=(0,o.UO)(),t=`spotify:show:${e}`,{data:a,error:s}=(0,Ut.l)(t);return!a||s?(0,A.jsx)(d.h,{hasError:!!s,errorMessage:l.ag.get("error.not_found.title.page")}):(0,Be.l6)(a)?(0,A.jsx)(i.Suspense,{fallback:null,children:(0,A.jsx)(Oa.C,{pageId:r.Wg.PODCAST_SHOW_AUDIOBOOK,uri:t,children:(0,A.jsx)(Et,{metadata:a})})}):(0,A.jsx)(i.Suspense,{fallback:null,children:(0,A.jsx)(Oa.C,{pageId:r.Wg.PODCAST,uri:t,children:(0,A.jsx)($t,{uri:a.uri,children:(0,A.jsx)(na,{uri:a.uri,defaultSortParam:ia(a.consumptionOrder),children:(0,A.jsx)(La,{showId:e,metadata:a})})})})})}))},25915:(e,t,a)=>{a.d(t,{k:()=>n});var i=a(56162);const s="rTMkDBDp47Eo12ZEQv4U";var o=a(4637);const n=({copyrights:e,courtesyLine:t})=>{const a=(e||[]).map(((e,t)=>{const a=e.text.replace(/^(\(C\)\s+)/,"").replace(/^(\(P\)\s+)/,"").replace(/^(©\s+)/,"").replace(/^(℗\s+)/,"");let s;return s="C"===e.type?"©":"P"===e.type?"℗":`(${e.type})`,(0,o.jsx)(i.D,{as:"p",variant:"finale",dir:"auto",children:`${s} ${a}`},t)}));return t&&a.unshift((0,o.jsx)(i.D,{as:"p",variant:"finale",dir:"auto",children:t},a.length)),(0,o.jsx)("div",{className:s,children:a})}},71857:(e,t,a)=>{a.d(t,{j:()=>s,vI:()=>i});const i=(e,t)=>{const a=t?new URLSearchParams(t.search):void 0;return"1"===a?.get(e)},s=(e,t)=>e.map((e=>i(e,t)))},90350:(e,t,a)=>{a.d(t,{k:()=>i});let i=function(e){return e.RichAlbumPageUI="ralphui",e.RichAlbumPageData="ralphdata",e.I18nSEO="i18nSEO",e.RTPFeaturedArtists="rtpv2p1",e.RTPTrackCredits="rtpv2p2",e.BlendParty="bp",e.BlendPartyV2="bpv2",e.VideoPodcastShowTitleTag="vidpodshow",e.I18nAdditionalPages="i18nap",e}({})}}]);
//# sourceMappingURL=xpui-routes-show.js.map