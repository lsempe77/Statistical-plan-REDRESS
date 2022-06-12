library(ggplot2)
library(ggbrace)

Outcome <- c(25, 28,
             30, 36,
             29, 37, 
             32, 43)
Type <- c("Control B - Standard care","Control B - Standard care",
          "Control A - C.M","Control A - C.M",
          "Treatment B - REDRESS", "Treatment B - REDRESS",
          "Treatment A - REDRESS", "Treatment A - REDRESS")
Period<- c(1,2,1,2,1,2,1,2)
df <- data.frame(Outcome,Period,Type)


p<-ggplot(df) + 
  geom_point (aes(Period,Outcome,colour=Type)) +
  geom_line (aes(Period,Outcome,colour=Type)) +
  geom_rect(aes(xmin=.95, xmax=1.15, ymin=24.5, ymax=29.8), color="darkorange", fill=NA) + 
  geom_rect(aes(xmin=1.95, xmax=2.15, ymin=26.5, ymax=37.8), color="darkorange", fill=NA) + 
  geom_text(aes(1.5,23),label="Study B",size=4,colour="darkorange") + 
  geom_rect(aes(xmin=.9, xmax=1.1, ymin=29.5, ymax=33), color="purple", fill=NA) + 
  geom_rect(aes(xmin=1.9, xmax=2.1, ymin=35.5, ymax=43.5), color="purple", fill=NA) + 
  geom_text(aes(1.5,44.5),label="Study A",size=4,colour="purple") + 
  geom_brace(aes(c(.8,.85), c(25, 29), label="B0"),inherit.data=F, labelsize=3, rotate= 270,
             colour="darkorange") +
  geom_brace(aes(c(2.3,2.5), c(28, 37), label="B1"),inherit.data=F, labelsize=3, rotate = 90,
             colour="darkorange") + 
  geom_text(aes(2.9,32.7),label="Estimator Study B (effects of REDRESS on standard)= B1-B0",size=3.5,
            colour="darkorange",hjust = 0) +
  geom_brace(aes(c(.8,.85), c(30, 32), label="A0"),inherit.data=F, labelsize=3, rotate= 270,
             colour="purple") +
  geom_brace(aes(c(2.6,2.8), c(36, 43), label="A1"),inherit.data=F, labelsize=3, rotate = 90,
             colour="purple") + 
  geom_text(aes(2.9,40),label="Estimator Study A (effects of REDRESS on C.M.)= A1-A0",size=3.5,
            colour="purple",hjust = 0) +
  theme_light ( ) + 
  scale_x_continuous(name ="", 
                   breaks = c(1,2), limits = c(0,8), labels = c("Baseline","Endline"))+
  theme (legend.position = "bottom") +
  guides(colour=guide_legend(ncol=1)) + theme (axis.text = element_text(size=8),
                                               axis.text.y = element_blank())+
  xlab("Period")

